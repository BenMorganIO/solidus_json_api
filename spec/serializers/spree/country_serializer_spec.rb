describe Spree::CountrySerializer do
  let(:country) { create :country }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new country) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "iso" : "#{country.iso}",
            "iso3" : "#{country.iso3}",
            "iso_name" : "#{country.iso_name}",
            "name" : "#{country.name}",
            "numcode" : #{country.numcode},
            "states_required" : #{country.states_required}
          },
          "relationships" : {
            "states" : {
              "data" : []
            }
          },
          "type" : "spree_countries"
        }
      }
    JSON
  end
end
