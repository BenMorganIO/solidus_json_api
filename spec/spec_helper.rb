require 'simplecov'
require 'coveralls'

Coveralls.wear!('rails')

SimpleCov.start do
  add_filter 'spec/dummy'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Serializers', 'app/serializers'
  add_group 'Libraries', 'lib'
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'rspec/its'
require 'database_cleaner'
require 'ffaker'
require 'json_spec'
require 'shoulda/matchers'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

require 'spree/testing_support/factories'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include JsonSpec::Helpers

  config.infer_spec_type_from_file_location!
  config.mock_with :rspec
  config.color = true
  config.use_transactional_fixtures = false
  config.fail_fast = ENV['FAIL_FAST'] || false
  config.order = "random"

  config.before :suite do
    ActiveModel::Serializer.config.adapter = :json_api

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.strategy = RSpec.current_example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
