describe Spree::PriceSerializer do
  let(:price) { create :price }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new price) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "amount" : "19.99",
            "currency" : "USD",
            "display_amount" : "$19.99",
            "display_price" : "$19.99",
            "price" : "19.99"
          },
          "relationships" : {
            "variant" : {
              "data" : {
                "type" : "spree_variants"
              }
            }
          },
          "type" : "spree_prices"
        }
      }
    JSON
  end
end
