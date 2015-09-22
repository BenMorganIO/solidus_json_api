describe Spree::StateSerializer do
  let(:state) { create :state }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new state) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "abbr" : "#{state.abbr}",
            "name" : "#{state.name}"
          },
          "relationships" : {
            "country" : {
              "data" : {
                "type" : "spree_countries"
              }
            }
          },
          "type" : "spree_states"
        }
      }
    JSON
  end
end
