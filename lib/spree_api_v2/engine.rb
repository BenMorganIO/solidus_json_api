module SpreeApiV2
  class Engine < Rails::Engine
    require 'spree/core'

    if ENV['SOLIDUS_API'].nil?
      engine_name 'spree_api_v2'
    else
      engine_name 'solidus_api_v2'
    end

    isolate_namespace Spree

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
