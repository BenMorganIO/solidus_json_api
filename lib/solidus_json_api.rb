begin
  require 'solidus_core'
rescue LoadError
  require 'spree_core'
  ENV['SPREE_API'] = 'true'
end

require 'active_model_serializers'

require 'solidus_json_api/config'
require 'solidus_json_api/engine'
