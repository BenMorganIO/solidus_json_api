module Spree
  class LineItemSerializer < Spree::BaseSerializer
    attributes :id, :quantity, :variant_id, :order_id, :currency, :cost_price,
               :adjustment_total, :additional_tax_total, :price

    %w(amount total).each do |money_method|
      attributes money_method, "display_#{money_method}"
    end

    belongs_to :order
    belongs_to :variant
  end
end
