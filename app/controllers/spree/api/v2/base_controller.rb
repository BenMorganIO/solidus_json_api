module Spree
  module Api
    module V2
      class BaseController < Spree::Api::BaseController
        include Spree::Api::V2::Renderable
      end
    end
  end
end
