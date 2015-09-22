module Spree
  class TaxonomySerializer < Spree::BaseSerializer
    attributes :name, :position

    has_many :taxons
  end
end
