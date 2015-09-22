module Spree
  class VariantSerializer < Spree::BaseSerializer
    attributes :sku, :weight, :height, :width, :depth, :is_master, :position,
               :name, :price, :display_price

    has_many :prices
    has_many :option_values
    has_many :images

    belongs_to :product
  end
end
