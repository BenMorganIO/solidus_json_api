describe Spree::OptionValueSerializer do
  let(:option_value) { create :option_value }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new option_value) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "name" : "#{option_value.name}",
            "position" : #{option_value.position},
            "presentation" : "#{option_value.presentation}"
          },
          "relationships" : {
            "option_type" : {
              "data" : {
                "type" : "spree_option_types"
              }
            },
            "variants" : {
              "data" : []
            }
          },
          "type" : "spree_option_values"
        }
      }
    JSON
  end
end
