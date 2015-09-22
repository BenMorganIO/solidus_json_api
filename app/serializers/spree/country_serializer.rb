module Spree
  class CountrySerializer < Spree::BaseSerializer
    attributes :iso_name, :iso, :iso3, :name, :numcode, :states_required

    has_many :states
  end
end
