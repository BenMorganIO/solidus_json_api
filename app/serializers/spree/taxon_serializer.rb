module Spree
  class TaxonSerializer < Spree::BaseSerializer
    attributes :name, :permalink, :position, :description, :meta_title, :links,
               :meta_description, :meta_keywords, :depth

    belongs_to :taxonomy
    belongs_to :parent, serializer: TaxonSerializer
    has_many :children, serializer: TaxonSerializer

    def links
      image_links object.icon
    end
  end
end
