class RailsLint
  def lint
    lint_ruby
    lint_erb
  end

  def lint_ruby(autocorrect: false)
    require "rubocop"
    cli = RuboCop::CLI.new
    puts "Linting Ruby..."
    spec = Gem::Specification.find_by_name("rails-lint")
    args = ["--config=#{File.expand_path(".rubocop.yml", spec.gem_dir)}", "--display-cop-names", "--force-exclusion"]
    args << "--autocorrect-all" if autocorrect
    cli.run(args)
  end

  def lint_erb(autocorrect: false)
    require "erb_lint/cli"

    cli = ERBLint::CLI.new
    spec = Gem::Specification.find_by_name("rails-lint")
    puts "Linting ERB templates..."
    args = ["--lint-all", "--enable-all-linters", "--allow-no-files", "--config=#{File.expand_path(".erb-lint.yml", spec.gem_dir)}"]
    args << "--autocorrect" if autocorrect
    cli.run(args)
  end
end
