module Spree
  class PriceSerializer < Spree::BaseSerializer
    attributes :amount, :price, :display_amount, :display_price, :currency

    belongs_to :variant
  end
end
