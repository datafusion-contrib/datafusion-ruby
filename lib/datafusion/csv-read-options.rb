# Copyright 2022 Sutou Kouhei <kou@clear-code.com>
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
# limitations under the License.

require_relative "options-try-convertable"

module DataFusion
  class CSVReadOptions
    # @api private
    extend OptionsTryConvertable

    alias_method :set_delimiter_raw, :set_delimiter
    def set_delimiter(delimiter)
      if delimiter.is_a?(String) and delimiter.length == 1
        delimiter = delimiter.ord
      end
      set_delimiter_raw(delimiter)
    end
    alias_method :delimiter_raw=, :delimiter=
    alias_method :delimiter=, :set_delimiter
  end
end
