describe Spree::LineItemSerializer do
  let(:line_item) { create :line_item }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new line_item) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "additional_tax_total" : "0.0",
            "adjustment_total" : "0.0",
            "amount" : "10.0",
            "cost_price" : "17.0",
            "currency" : "USD",
            "display_amount" : "$10.00",
            "display_total" : "$10.00",
            "order_id" : #{line_item.order_id},
            "price" : "10.0",
            "quantity" : 1,
            "total" : "10.0",
            "variant_id" : #{line_item.variant_id}
          },
          "relationships" : {
            "order" : {
              "data" : {
                "type" : "spree_orders"
              }
            },
            "variant" : {
              "data" : {
                "type" : "spree_variants"
              }
            }
          },
          "type" : "spree_line_items"
        }
      }
    JSON
  end
end
