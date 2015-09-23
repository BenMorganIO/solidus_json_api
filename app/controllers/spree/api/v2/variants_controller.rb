module Spree
  module Api
    module V2
      class VariantsController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user

        def index
          render_collection variants.includes(:default_price, :prices, :option_values, :product, :images)
        end

        def show
          if params[:price_id]
            render_instance Spree::Price.find(params[:price_id]).variant
          elsif params[:image_id]
            render_instance Spree::Image.variants.find(params[:image_id]).viewable
          else
            render_instance variants.find(params[:id])
          end
        end

        private

        def variants
          if params[:product_id]
            Spree::Product.find(params[:product_id]).variants_including_master
          elsif params[:option_value_id]
            Spree::OptionValue.find(params[:option_value_id]).variants
          else
            Spree::Variant
          end
        end
      end
    end
  end
end
