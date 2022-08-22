# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

class SessionContextTest < Test::Unit::TestCase
  def setup
    @context = DataFusion::SessionContext.new
  end

  sub_test_case("#register") do
    test("Arrow::RecordBatch") do
      record_batch = Arrow::RecordBatch.new(boolean: [true, false, nil],
                                            integer: [1, nil, 3])
      @context.register("data", record_batch)
      data_frame = @context.sql("SELECT * FROM data")
      assert_equal(record_batch.to_table, data_frame.to_table)
    end

    test("Arrow::Table") do
      boolean_chunks = [
        Arrow::Array.new([true]),
        Arrow::Array.new([false, nil]),
      ]
      integer_chunks = [
        Arrow::Array.new([1, nil]),
        Arrow::Array.new([3]),
      ]
      table = Arrow::Table.new(boolean: Arrow::ChunkedArray.new(boolean_chunks),
                               integer: Arrow::ChunkedArray.new(integer_chunks))
      @context.register("data", table)
      data_frame = @context.sql("SELECT * FROM data")
      assert_equal(table, data_frame.to_table)
    end
  end

  test("#register_csv") do
    Tempfile.open(["red-datafusion", ".tsv"]) do |tsv|
      tsv.puts("string\tinteger\n")
      tsv.puts("hello\t1\n")
      tsv.puts("world\t10\n")
      tsv.close
      @context.register_csv("data",
                            tsv.path,
                            delimiter: "\t",
                            file_extension: ".tsv")
      data_frame = @context.sql("SELECT * FROM data")
      table = Arrow::Table.new([
                                 {
                                   name: "string",
                                   data_type: :string,
                                   nullable: false,
                                 },
                                 {
                                   name: "integer",
                                   data_type: :int64,
                                   nullable: false,
                                 },
                               ],
                               [
                                 ["hello", 1],
                                 ["world", 10],
                               ])
      assert_equal(table, data_frame.to_table)
    end
  end

  test("#register_parquet") do
    table = Arrow::Table.new(boolean: [true, false, nil],
                             integer: [1, nil, 3])
    Tempfile.open(["red-datafusion", ".parquet"]) do |parquet|
      parquet.close
      table.save(parquet.path)
      @context.register_parquet("data",
                                parquet.path,
                                pruning: true)
      data_frame = @context.sql("SELECT * FROM data WHERE integer > 2")
      filtered_table = Arrow::Table.new([
                                          {
                                            name: "boolean",
                                            data_type: :boolean,
                                          },
                                          {
                                            name: "integer",
                                            data_type: :uint8,
                                          },
                                        ],
                                        [
                                          [nil, 3],
                                        ])
      assert_equal(filtered_table, data_frame.to_table)
    end
  end
end
