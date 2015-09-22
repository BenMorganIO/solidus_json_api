describe Spree::TaxonSerializer do
  let(:taxon) { create :taxon }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new taxon) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "depth" : 0,
            "description" : null,
            "links": {
              "large" : "/assets/default_taxon.png",
              "mini" : "/assets/default_taxon.png",
              "original" : "/assets/default_taxon.png",
              "product" : "/assets/default_taxon.png",
              "small" : "/assets/default_taxon.png"
            },
            "meta_description" : null,
            "meta_keywords" : null,
            "meta_title" : null,
            "name" : "#{taxon.name}",
            "permalink" : "#{taxon.permalink}",
            "position" : 0
          },
          "relationships" : {
            "children" : {
              "data" : []
            },
            "parent" : {
              "data" : null
            },
            "taxonomy" : {
              "data" : {
                "type" : "spree_taxonomies"
              }
            }
          },
          "type" : "spree_taxons"
        }
      }
    JSON
  end
end
