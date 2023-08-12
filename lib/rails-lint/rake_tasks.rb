require_relative "./rails_lint"

task "rails-lint" do
  rails_lint = RailsLint.new
  rails_lint.lint
end

task "rails-lint-fix" do
  rails_lint = RailsLint.new
  rails_lint.lint_ruby(autocorrect: true)
  rails_lint.lint_erb(autocorrect: true)
end
