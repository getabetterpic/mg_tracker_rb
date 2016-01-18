$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mg_tracker'

require 'awesome_print'
require 'webmock/rspec'
require './lib/mg_tracker'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end

  config.profile_examples = 10
  config.order = :random
end
