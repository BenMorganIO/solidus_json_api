module Spree
  module Api
    module V2
      class OrdersController < Spree::Api::V2::BaseController
        def index
          render_collection orders
        end

        def show
          render_instance orders.find(params[:id])
        end

        private

        def orders
          @current_api_user.admin? ? Spree::Order : @current_api_user.orders
        end
      end
    end
  end
end
