# -*- ruby -*-
#
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

require_relative "lib/datafusion/version"

Gem::Specification.new do |spec|
  spec.name = "red-datafusion"
  spec.version = DataFusion::VERSION
  spec.homepage = "https://github.com/datafusion-contrib/datafusion-ruby"
  spec.authors = ["Sutou Kouhei"]
  spec.email = ["kou@clear-code.com"]

  spec.summary = "Red DataFusion is the Ruby bindings of Apache Arrow DataFusion"
  spec.description =
    "Apache Arrow DataFusion is an extensible query execution framework " +
    "that uses Apache Arrow as its in-memory format."
  spec.license = "Apache-2.0"
  spec.files = [
    "#{spec.name}.gemspec",
    "Gemfile",
    "LICENSE",
    "NEWS.md",
    "README.md",
    "Rakefile",
  ]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.extensions = ["dependency-check/Rakefile"]

  spec.add_runtime_dependency("red-arrow")

  # TODO
  # required_msys2_package_version = version_components[0, 3].join(".")
  # spec.metadata["msys2_mingw_dependencies"] =
  #   "datafusion>=#{required_msys2_package_version}"
end
