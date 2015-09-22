module Spree
  class OptionValueSerializer < Spree::BaseSerializer
    attributes :name, :presentation, :position

    belongs_to :option_type
    has_many :variants
  end
end
