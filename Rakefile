require 'bundler'
Bundler::GemHelper.install_tasks name: ENV['GEMNAME']

require 'rspec/core/rake_task'

require 'generators/spree/dummy/dummy_generator'
require 'generators/spree/install/install_generator'

RSpec::Core::RakeTask.new

task :default do
  if Dir['spec/dummy'].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir('../../')
  end
  Rake::Task[:spec].invoke
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV["RAILS_ENV"] = 'test'

  Spree::DummyGeneratorHelper.inject_extension_requirements = true
  Spree::DummyGenerator.start %w(--lib_name=solidus_json_api --quiet)

  Spree::InstallGenerator.class_eval do
    def config_spree_yml() end
  end

  Spree::InstallGenerator.start %w(
    --lib_name=solidus_json_api --auto-accept --migrate=false --seed=false
    --sample=false --quiet --user_class=Spree::LegacyUser
  )

  puts 'Setting up dummy database...'
  system "bundle exec rake db:drop db:create db:migrate > #{File::NULL}"
end
