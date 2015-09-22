module Spree
  module Api
    module V2
      class TaxonomiesController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          super Spree::Taxonomy.includes(:taxons)
        end

        def show
          if params[:taxon_id].present?
            super Spree::Taxon.find(params[:taxon_id]).taxonomy
          else
            super Spree::Taxonomy.find(params[:id])
          end
        end
      end
    end
  end
end
