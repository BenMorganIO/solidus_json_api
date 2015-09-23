module Spree
  module Api
    module V2
      class OptionTypesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          render_collection option_types.includes(:option_values, :products)
        end

        def show
          if params[:option_value_id]
            render_instance Spree::OptionValue.find(params[:option_value_id]).option_type
          else
            render_instance option_types.find(params[:id])
          end
        end

        private

        def option_types
          if params[:product_id]
            Spree::Product.find(params[:product_id]).option_types
          else
            Spree::OptionType
          end
        end
      end
    end
  end
end
