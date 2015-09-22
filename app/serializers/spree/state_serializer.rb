module Spree
  class StateSerializer < Spree::BaseSerializer
    attributes :name, :abbr

    belongs_to :country
  end
end
