# Copyright 2022-2023 Sutou Kouhei <kou@clear-code.com>
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

module DataFusion
  class Loader < GObjectIntrospection::Loader
    class << self
      def load
        super("DataFusion", DataFusion)
      end
    end

    private
    def post_load(repository, namespace)
      require_libraries
    end

    def require_libraries
      require_relative "csv-read-options"
      require_relative "parquet-read-options"
      require_relative "parquet-writer-properties"
      require_relative "session-context"
    end
  end
end
