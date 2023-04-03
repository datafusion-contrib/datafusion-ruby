# Copyright 2023 Sutou Kouhei <kou@clear-code.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and

class DataFrameTest < Test::Unit::TestCase
  def setup
    @context = DataFusion::SessionContext.new
    @table = Arrow::Table.new(boolean: [true, false, nil],
                                     integer: [1, nil, 3])
    @context.register("data", @table)
    @data_frame = @context.sql("SELECT * FROM data")
    begin
      Dir.mktmpdir do |tmp_dir|
        @tmp_dir = tmp_dir
        yield
      end
    end
  end

  test("#write_parquet") do
    output_dir = File.join(@tmp_dir, "parquet")
    @data_frame.write_parquet(output_dir, max_row_group_size: 1)
    @context.register_parquet("written_data", output_dir)
    data_frame = @context.sql("SELECT * FROM written_data")
    assert_equal(@table, data_frame.to_table)
  end
end
