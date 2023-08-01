# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "rails-lint"
  spec.version = "1.0.3"
  spec.authors = ["k0va1"]
  spec.email = ["al3xander.koval@gmail.com"]

  spec.summary = "k0va1's rubocop template for Rails projects"
  spec.description = "k0va1's rubocop template for Rails projects"
  spec.homepage = "https://github.com/k0va1/rails-lint"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop-ruby"
  spec.add_dependency "rubocop-rails"
  spec.add_dependency "erb_lint"
end
