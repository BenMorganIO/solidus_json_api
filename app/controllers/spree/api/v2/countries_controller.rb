module Spree
  module Api
    module V2
      class CountriesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          super Spree::Country.includes(:states)
        end

        def show
          if params[:state_id].present?
            super Spree::State.find_country(params[:state_id])
          else
            super Spree::Country.find(params[:id])
          end
        end
      end
    end
  end
end
