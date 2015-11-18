source 'https://rubygems.org'

if ENV['GEMNAME'].nil? || ENV['GEMNAME'] == 'solidus_json_api'
  gem 'solidus_api', github: 'solidusio/solidus'
  gem 'solidus_auth_devise', github: 'solidusio/solidus_auth_devise'

  gemspec name: 'solidus_json_api'
elsif ENV['GEMNAME'] == 'spree_json_api'
  gem 'spree_api', github: 'spree', branch: '3-0-stable'
  gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '3-0-stable'

  gemspec name: 'spree_json_api'
end
