describe Spree::AddressSerializer do
  let(:address) { create :address }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new address) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "address1" : "#{address.address1}",
            "address2" : "#{address.address2}",
            "city" : "#{address.city}",
            "first_name" : "#{address.first_name}",
            "last_name" : "#{address.last_name}",
            "phone" : "#{address.phone}",
            "zipcode" : "#{address.zipcode}"
          },
          "relationships" : {
            "country" : {
              "data" : {
                "type" : "spree_countries"
              }
            },
            "state" : {
              "data" : {
                "type" : "spree_states"
              }
            }
          },
          "type" : "spree_addresses"
        }
      }
    JSON
  end
end
