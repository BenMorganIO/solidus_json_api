describe Spree::ImageSerializer do
  let(:image) { create :image }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new image) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "alt" : null,
            "links" : {
              "large" : "#{image.attachment.url(:large)}",
              "mini" : "#{image.attachment.url(:mini)}",
              "original" : "#{image.attachment.url(:original)}",
              "product" : "#{image.attachment.url(:product)}",
              "small" : "#{image.attachment.url(:small)}"
            },
            "position" : 1
          },
          "relationships" : {
            "viewable" : {
              "data" : null
            }
          },
          "type" : "spree_images"
        }
      }
    JSON
  end
end
