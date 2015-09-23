module Spree
  module Api
    module V2
      class TaxonsController < Spree::Api::V2::BaseController
        skip_before_action :authenticate_user, only: [:index, :show]

        def index
          render_collection taxons
        end

        def show
          render_instance taxon
        end

        private

        def taxon
          if params[:taxon_id].present?
            taxons.includes(parent: taxon_associations).find(params[:taxon_id]).parent
          else
            taxons.find(params[:id])
          end
        end

        def taxons
          if params[:taxonomy_id].present?
            Spree::Taxonomy.find(params[:taxonomy_id]).taxons
              .includes(*taxon_associations.-([:taxonomy]))
          else
            Spree::Taxon.includes(*taxon_associations)
          end
        end

        def taxon_associations
          [:products, :taxonomy, :parent]
        end
      end
    end
  end
end
