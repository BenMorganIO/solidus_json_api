describe Spree::OptionTypeSerializer do
  let(:option_type) { create :option_type }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new option_type) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "name" : "#{option_type.name}",
            "position" : #{option_type.position},
            "presentation" : "#{option_type.presentation}"
          },
          "relationships" : {
            "option_values" : {
              "data" : []
            },
            "products" : {
              "data" : []
            }
          },
          "type" : "spree_option_types"
        }
      }
    JSON
  end
end
