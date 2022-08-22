<!--
  Copyright 2022 Sutou Kouhei <kou@clear-code.com>

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

# Red DataFusion

The Ruby bindings for [Apache Arrow
DataFusion](https://github.com/apache/arrow-datafusion). This uses
[DataFusion C
API](https://github.com/datafusion-contrib/datafusion-c).

## How to install

```bash
gem install red-datafusion
```

## How to use

```ruby
require "datafusion"

context = DataFusion::SessionContext.new
table = Arrow::Table.new(boolean: [true, nil, false],
                         integer: [1, 2, nil])
context.register("data", table)
data_frame = context.sql("SELECT * FROM data WHERE boolean = true")
puts(data_frame.to_table)
#      boolean    integer
# 0       true          1
```

## Alternative

There is another Ruby bindings available at gem ["arrow-datafusion"](https://github.com/jychen7/arrow-datafusion-ruby). It focus on running query on Object Store and does not bundle with gem "red-arrow".
