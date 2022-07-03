require_relative "lib/datafusion/version"

Gem::Specification.new do |spec|
  spec.name = "arrow-datafusion"
  spec.version = Datafusion::VERSION
  spec.authors = ["Datafusion Contrib Developers"]
  spec.homepage = "https://github.com/datafusion-contrib/datafusion-ruby"

  spec.summary = "Ruby bindings of Apache Arrow Datafusion"
  spec.description =
    "Ruby bindings of Apache Arrow Datafusion"
  spec.license = "Apache-2.0"

  spec.files = ["README.md", "#{spec.name}.gemspec", "LICENSE"]
  spec.files += Dir.glob("ext/datafusion_ruby/src/**/*.rs")
  spec.files += ["ext/datafusion_ruby/Rakefile", "ext/datafusion_ruby/Cargo.toml", "ext/datafusion_ruby/Cargo.lock"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.extensions = ["ext/datafusion_ruby/Rakefile"]

  # actually a build time dependency, but that's not an option.
  spec.add_runtime_dependency "rake", "> 1"
  spec.required_ruby_version = ">= 2.6.0"
end
