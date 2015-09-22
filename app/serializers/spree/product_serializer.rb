module Spree
  class ProductSerializer < Spree::BaseSerializer
    attributes :name, :description, :slug, :meta_description, :meta_keywords

    has_one :master

    has_many :variants
    has_many :taxons
    has_many :option_types
    has_many :images
  end
end
