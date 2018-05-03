ENV['RACK_ENV'] = 'capital_oneder_test'

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'pg'
require 'rake'
require './app/app.rb'

Rake.application.load_rakefile


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console])
SimpleCov.start

require 'test_helper_methods/fill_in_form.rb'
require 'test_helper_methods/json_mock_response.rb'
require './app/models/database.rb'
require './app/models/citizen.rb'


Capybara.app = CAPONE

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['create_table_citizens_test'].execute
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
