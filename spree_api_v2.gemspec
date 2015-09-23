# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_api_v2'
  s.version     = '3.0.4'
  s.summary     = 'The V2 API for Spree.'
  s.description = 'Adds an assortment of new api endpoints that are JSON API compatible.'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Ben A. Morgan'
  s.email     = 'ben@benmorgan.io'
  s.homepage  = 'http://www.spreecommerce.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_api', '~> 3.0.4'
  s.add_dependency 'active_model_serializers', '= 0.10.0.rc2'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.3'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'json_spec', '~> 1.1.4'
  s.add_development_dependency 'shoulda-matchers'
end
