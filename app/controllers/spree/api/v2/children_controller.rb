module Spree
  module Api
    module V2
      class ChildrenController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          render_collection children.includes(:products, :taxonomy, :children, :parent)
        end

        def show
          render_instance children.find(params[:id])
        end

        private

        def children
          if params[:taxon_id]
            Spree::Taxon.find(params[:taxon_id])
          end.children
        end

        def filter_attributes
          Spree::TaxonSerializer._attributes
        end
      end
    end
  end
end
