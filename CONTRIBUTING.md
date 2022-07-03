# Introduction

datafusion-ruby follows the standard Ruby gem structure. It uses [Magnus](https://github.com/matsadler/magnus) as the Ruby bindings for Rust.

```
|
|- lib # Ruby code
|- ext # Rust code
```

# Develop

## setup

```
make install
```

## Test

```
# compile rust and run ruby tests
make test
```

## Formating

```
make fmt
```

# FAQ

## Why Magnus?

As of 2022-07, there are a few popular Ruby bindings for Rust, [Rutie](https://github.com/danielpclark/rutie), [Magnus](https://github.com/matsadler/magnus) and [other alternatives](https://github.com/matsadler/magnus#alternatives). Magnus is picked because its API seems cleaner and it seems more clear about safe vs unsafe. The author of Magnus have a "maybe bias" comparison in this [reddit thread](https://www.reddit.com/r/ruby/comments/uskibb/comment/i98rds4/?utm_source=share&utm_medium=web2x&context=3). It is totally subjective and it should not be large effort if we decides to switch to different Ruby bindings fr Rust in future.

## Why the module name and gem name are different?

The module name `Datafusion` follows the [datafusion](https://github.com/apache/arrow-datafusion) and [datafusion-python](https://github.com/datafusion-contrib/datafusion-python). The gem name `datafusion` [is occupied in rubygems.org at 2016](https://rubygems.org/gems/datafusion), so our gem is called `arrow-datafusion`.

Similarly to the Ruby bindings of Arrow, its gem name is called [red-arrow](https://github.com/apache/arrow/tree/master/ruby/red-arrow) and the module is called `arrow`.

## What is the relationship between Datafusion Ruby and Red Arrow?

Datafusion Ruby is the Ruby bindings of Arrow Datafusion (Rust). Red Arrow is the Ruby bindings of Arrow (C++). To keep Datafusion Ruby simpler, we try to not couple with Red Arrow in core features. If need, we can add additional gems (e.g. red-arrow-datafusion) to support Red Arrow in Datafusion Ruby, similar to how [red-parquet](https://github.com/apache/arrow/blob/2c7c12fd408339817f0322f137d25e9f60a87a26/ruby/red-parquet/red-parquet.gemspec#L44) use red-arrow.

ps: Datafusion Python was coupled with PyArrow. There is a proposal to separate them in medium to long term. For detail, please refer to [Can datafusion-python be used without pyarrow?](https://github.com/datafusion-contrib/datafusion-python/issues/22).
