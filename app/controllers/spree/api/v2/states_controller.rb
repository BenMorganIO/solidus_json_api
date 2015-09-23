module Spree
  module Api
    module V2
      class StatesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user

        def index
          render_collection states
        end

        def show
          render_instance states.find(params[:id])
        end

        private

        def states
          @states ||= begin
            if params[:country_id].present?
              Spree::Country.find(params[:country_id]).states.includes(:country)
            else
              Spree::State.includes(:country)
            end
          end
        end
      end
    end
  end
end
