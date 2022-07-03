require_relative "lib/datafusion/version"

Gem::Specification.new do |spec|
  spec.name = "arrow-datafusion"
  spec.version = Datafusion::VERSION
  spec.authors = ["Datafusion Contrib Developers"]
  spec.homepage = "https://github.com/datafusion-contrib/datafusion-ruby"

  spec.summary = "Ruby bindings of Apache Arrow Datafusion"
  spec.description =
    "DataFusion is an extensible query execution framework, written in Rust, that uses Apache Arrow as its in-memory format."
  spec.license = "Apache-2.0"

  spec.files = ["README.md", "#{spec.name}.gemspec", "LICENSE"]
  spec.files += Dir.glob("ext/datafusion/src/**/*.rs")
  spec.files += ["ext/datafusion/Rakefile", "ext/datafusion/Cargo.toml", "ext/datafusion/Cargo.lock"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.extensions = ["ext/datafusion/Rakefile"]

  # actually a build time dependency, but that's not an option.
  spec.add_runtime_dependency "rake", "> 1"
end
