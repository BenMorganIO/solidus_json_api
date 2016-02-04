module Spree
  class ImageSerializer < Spree::BaseSerializer
    attributes :position, :alt, :links

    belongs_to :viewable

    def links
      image_links object.attachment
    end
  end
end
