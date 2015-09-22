describe Spree::VariantSerializer do
  let(:image) { create :image }
  let(:variant) { create :variant, images: [image] }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new variant) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "depth" : "#{variant.depth}",
            "display_price" : "#{variant.display_price}",
            "height" : "#{variant.height}",
            "is_master" : #{variant.is_master},
            "name" : "#{variant.name}",
            "position" : #{variant.position},
            "price" : "#{variant.price}",
            "sku" : "#{variant.sku}",
            "weight" : "#{variant.weight}",
            "width" : "#{variant.width}"
          },
          "relationships" : {
            "images" : {
              "data" : [
                {
                  "type" : "spree_images"
                }
              ]
            },
            "option_values" : {
              "data" : [
                {
                  "type" : "spree_option_values"
                }
              ]
            },
            "prices" : {
              "data" : [
                {
                  "type" : "spree_prices"
                }
              ]
            },
            "product" : {
              "data" : {
                "type" : "spree_products"
              }
            }
          },
          "type" : "spree_variants"
        }
      }
    JSON
  end
end
