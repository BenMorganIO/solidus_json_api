module Spree
  module Api
    module V2
      class OrdersController < Spree::Api::V2::BaseController
        def show
          super @current_api_user.orders.find(params[:id])
        end
      end
    end
  end
end
