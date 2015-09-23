module Spree
  module Api
    module V2
      class PricesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user

        def index
          render_collection params[:variant_id] ? prices : prices.includes(:variant)
        end

        def show
          render_instance prices.find(params[:id])
        end

        private

        def prices
          if params[:variant_id]
            Spree::Variant.find(params[:variant_id]).prices
          else
            Spree::Price
          end
        end
      end
    end
  end
end
