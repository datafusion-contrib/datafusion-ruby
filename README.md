# DataFusion in Ruby

This is a Ruby library that binds to [Apache Arrow](https://arrow.apache.org/) in-memory query engine [DataFusion](https://github.com/apache/arrow-datafusion).

It allows you to build a plan through SQL or a DataFrame API against in-memory data, parquet or CSV files, run it in a multi-threaded environment, and obtain the result back in Ruby.

## Quick Start

Gemfile
```
gem "arrow-datafusion"
```

App
```ruby
require "datafusion"

ctx = Datafusion.SessionContext.new
ctx.register_csv("csv", "test.csv")
ctx.sql("SELECT * FROM csv").collect
```

## Supported features

SessionContext
- [x] new
- [ ] register_csv
- [ ] sql
- [ ] register_parquet
- [ ] register_record_batches
- [ ] register_udf

Dataframe
- [ ] new
- [ ] collect
- [ ] schema
- [ ] select_columns
- [ ] select
- [ ] filter
- [ ] aggregate
- [ ] sort
- [ ] limit
- [ ] show
- [ ] join
- [ ] explain

## Contribution Guide

Please see [Contribution Guide](CONTRIBUTING.md) for information about contributing to DataFusion in Ruby.
