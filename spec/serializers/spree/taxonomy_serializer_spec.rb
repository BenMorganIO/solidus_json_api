describe Spree::TaxonomySerializer do
  let(:taxonomy) { create :taxonomy }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new taxonomy) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "name" : "#{taxonomy.name}",
            "position" : #{taxonomy.position}
          },
          "relationships" : {
            "taxons" : {
              "data" : [
                {
                  "type" : "spree_taxons"
                }
              ]
            }
          },
          "type" : "spree_taxonomies"
        }
      }
    JSON
  end
end
