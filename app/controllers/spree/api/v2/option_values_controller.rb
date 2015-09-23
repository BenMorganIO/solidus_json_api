module Spree
  module Api
    module V2
      class OptionValuesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          render_collection option_values.includes(:option_type, :variants)
        end

        def show
          render_instance option_values.find(params[:id])
        end

        private

        def option_values
          if params[:option_type_id]
            Spree::OptionType.find(params[:option_type_id]).option_values
          elsif params[:variant_id]
            Spree::Variant.find(params[:variant_id]).option_values
          else
            Spree::OptionValue
          end
        end
      end
    end
  end
end
