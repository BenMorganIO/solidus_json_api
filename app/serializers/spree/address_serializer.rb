module Spree
  class AddressSerializer < Spree::BaseSerializer
    attributes :first_name, :last_name, :address1, :address2, :city, :zipcode,
               :phone

    belongs_to :state
    belongs_to :country
  end
end
