describe Spree::ProductSerializer do
  let(:image) { create :image }
  let(:product) { create :product }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new product) }

  before { product.images << image }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "description" : #{product.description.to_json},
            "meta_description" : null,
            "meta_keywords" : null,
            "name" : "#{product.name}",
            "slug" : "#{product.slug}"
          },
          "relationships" : {
            "images" : {
              "data" : [
                {
                  "type" : "spree_images"
                }
              ]
            },
            "master" : {
              "data" : {
                "type" : "spree_variants"
              }
            },
            "option_types" : {
              "data" : []
            },
            "taxons" : {
              "data" : []
            },
            "variants" : {
              "data" : []
            }
          },
          "type" : "spree_products"
        }
      }
    JSON
  end
end
