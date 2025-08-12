# frozen_string_literal: true

require_relative "lib/djotter/version"

Gem::Specification.new do |spec|
  spec.name = "djotter"
  spec.version = Djotter::VERSION
  spec.authors = ["Gustavo Aguiar"]
  spec.homepage = "https://github.com/gustavodiasag/djotter"
  spec.license = "MIT"

  spec.summary = "Shallow wrapper for a Djot implementation written in Rust"
  spec.description = "A wrapper for the jotdown Rust crate, solely for HTML generation"

  spec.required_ruby_version = ">= 3.4"
  spec.required_rubygems_version = ">= 3.7"

  spec.files = ["README.md", "Cargo.lock", "Cargo.toml"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("ext/**/*.{rb,rs,toml,lock}")
  spec.test_files = Dir.glob("/spec/**/*.{rb, test}")

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }

  spec.require_paths = ["lib"]
  spec.extensions = ["ext/djotter/extconf.rb"]

  spec.add_development_dependency("rake", "~> 13.3")
  spec.add_development_dependency("rake-compiler", "~> 1.3")
  spec.add_development_dependency("rspec", "~> 3.13")
end
