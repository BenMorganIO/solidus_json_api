module Spree
  module Api
    module V2
      class TaxonomiesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          render_collection Spree::Taxonomy.includes(:taxons)
        end

        def show
          if params[:taxon_id].present?
            render_instance Spree::Taxon.find(params[:taxon_id]).taxonomy
          else
            render_instance Spree::Taxonomy.find(params[:id])
          end
        end
      end
    end
  end
end
