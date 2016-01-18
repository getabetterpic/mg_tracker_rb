require 'rubocop'

RSpec.describe 'source code linting' do
  it 'should pass linting with RuboCop' do
    options, paths = RuboCop::Options.new.parse(%w(-R -D))
    runner = RuboCop::Runner.new(options, RuboCop::ConfigStore.new)
    all_passed = runner.run(paths)
    expect(all_passed).to be_truthy
  end
end
