describe Spree::OrderSerializer do
  let(:order) { create :completed_order_with_totals }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new order) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "additional_tax_total" : "0.0",
            "adjustment_total" : "0.0",
            "approved_at" : null,
            "canceled_at" : null,
            "channel" : "spree",
            "completed_at" : "#{order.completed_at.iso8601(3)}",
            "confirmation_delivered" : false,
            "currency" : "USD",
            "display_additional_tax_total" : "$0.00",
            "display_adjustment_total" : "$0.00",
            "display_included_tax_total" : "$0.00",
            "display_item_total" : "$10.00",
            "display_promo_total" : "$0.00",
            "display_shipment_total" : "$100.00",
            "display_total" : "$110.00",
            "email" : "#{order.email}",
            "included_tax_total" : "0.0",
            "item_count" : 1,
            "item_total" : "10.0",
            "number" : "#{order.number}",
            "payment_state" : null,
            "payment_total" : "0.0",
            "promo_total" : "0.0",
            "shipment_state" : null,
            "shipment_total" : "100.0",
            "special_instructions" : null,
            "state" : "complete",
            "total" : "110.0"
          },
          "relationships" : {
            "bill_address" : {
              "data" : {
                "type" : "spree_addresses"
              }
            },
            "line_items" : {
              "data" : [
                {
                  "type" : "spree_line_items"
                }
              ]
            },
            "ship_address" : {
              "data" : {
                "type" : "spree_addresses"
              }
            },
            "user" : {
              "data" : {
                "type" : "spree_users"
              }
            }
          },
          "type" : "spree_orders"
        }
      }
    JSON
  end
end
