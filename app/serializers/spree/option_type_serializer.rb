module Spree
  class OptionTypeSerializer < Spree::BaseSerializer
    attributes :name, :presentation, :position

    has_many :option_values
    has_many :products
  end
end
