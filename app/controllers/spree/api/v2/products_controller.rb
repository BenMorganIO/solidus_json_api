module Spree
  module Api
    module V2
      class ProductsController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          super products.includes :variants, :master, :taxons, :option_types, master: :images
        end

        def show
          if params[:price_id]
            super Spree::Price.find(params[:price_id]).product
          elsif params[:variant_id]
            super Spree::Variant.find(params[:variant_id]).product
          elsif params[:image_id]
            super Spree::Image.variants.find(params[:image_id]).viewable.product
          else
            super products.find(params[:id])
          end
        end

        private

        def products
          if params[:taxon_id].present?
            Spree::Taxon.find(params[:taxon_id]).products
          elsif params[:option_type_id]
            Spree::OptionType.find(params[:option_type_id]).products
          else
            Spree::Product
          end
        end
      end
    end
  end
end
