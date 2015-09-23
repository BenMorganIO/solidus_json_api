module Spree
  module Api
    module V2
      class ImagesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          render_collection images.includes(:viewable)
        end

        def show
          render_instance images.find(params[:id])
        end

        private

        def images
          if params[:product_id]
            Spree::Product.find(params[:product_id]).images
          elsif params[:variant_id]
            Spree::Variant.find(params[:variant_id]).images
          else
            Spree::Image
          end
        end
      end
    end
  end
end
