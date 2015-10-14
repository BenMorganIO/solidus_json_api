source 'https://rubygems.org'

if ENV['SOLIDUS_API'].nil?
  gem 'spree_api', github: 'spree', branch: '3-0-stable'
  gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '3-0-stable'

  gemspec name: 'spree_api_v2'
else
  gem 'solidus_api', github: 'solidusio/solidus'
  gem 'solidus_auth_devise', github: 'solidusio/solidus_auth_devise'

  gemspec name: 'solidus_api_v2'
end
