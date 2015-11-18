module Spree
  module Api
    module V2
      class LineItemsController < Spree::Api::V2::BaseController
        rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_error
        rescue_from Spree::Order::InsufficientStock, with: :render_insufficient_stock_error
        rescue_from RangeError, with: :render_range_error

        def create
          variant = Spree::Variant.find(line_item_params[:variant_id])
          order = @current_api_user.orders.find(line_item_params[:order_id])
          line_item = order.contents.add(variant, line_item_params[:quantity])
          render_instance line_item
        end

        private

        def line_item_params
          params.require(:data).require(:attributes).permit(:variant_id, :order_id, :quantity)
        end

        def render_range_error
          render json: error_response(:quantity_too_high), status: 400
        end

        def render_insufficient_stock_error
          render json: error_response(:product_out_of_stock), status: 400
        end

        def render_record_not_found_error
          render json: error_response(:record_not_found), status: 400
        end
      end
    end
  end
end
