module Spree
  module Api
    module V2
      module Renderable
        extend ActiveSupport::Concern

        protected

        def render_collection(collection = [])
          collection = collection.where(filter_params).paginate(page_params)
          render json: collection, include: params[:include],
                 meta: { page: page_details(collection) }
        end

        def render_instance(object = {})
          render json: object, include: params[:include]
        end

        private

        def error_response(resource)
          Spree::ErrorSerializer.new(resource).as_json
        end

        def filter_params
          params.fetch(:filter, {}).permit(filter_attributes << :id).transform_values do |value|
            value.split(',')
          end
        end

        def filter_attributes
          serializer = "Spree::#{controller_name.camelize.singularize}Serializer"
          serializer.constantize._attributes
        end

        def page_details(collection)
          {
            total_items: collection.total_count,
            total_pages: collection.total_pages,
            number: (page_params[:number] || 1).to_i,
            size: (page_params[:size] || Kaminari.config.default_per_page).to_i
          }
        end

        def page_params
          params.fetch(:page, {}).permit(:number, :size)
        end
      end
    end
  end
end
