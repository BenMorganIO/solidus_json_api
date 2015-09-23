module Spree
  module Api
    module V2
      class CountriesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          render_collection Spree::Country.includes(:states)
        end

        def show
          if params[:state_id].present?
            render_instance Spree::State.find_country(params[:state_id])
          else
            render_instance Spree::Country.find(params[:id])
          end
        end
      end
    end
  end
end
