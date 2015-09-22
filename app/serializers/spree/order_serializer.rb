module Spree
  class OrderSerializer < Spree::BaseSerializer
    attributes :email, :number, :state, :completed_at, :shipment_state,
               :payment_state, :special_instructions, :currency, :channel,
               :item_count, :approved_at, :confirmation_delivered,
               :considered_risky, :canceled_at, :payment_total, :total,
               :display_total

    %w(
      item adjustment shipment promo additional_tax included_tax
    ).each do |money_method|
      attributes "#{money_method}_total", "display_#{money_method}_total"
    end

    has_one :user
    has_one :bill_address
    has_one :ship_address

    has_many :line_items
  end
end
