module Spree
  module Api
    module V2
      class BaseController < Spree::Api::BaseController
        protected

        def index(collection = [])
          ActiveSupport::Deprecation.warn <<-TEXT.squish
            Using `super` is now deprecated. We're aiming to removing as much
            meta-programming as possible. Please use the `render_collection`
            method instead. This will be removed in 0.3.0.
          TEXT

          render_collection collection
        end

        def show(object = {})
          ActiveSupport::Deprecation.warn <<-TEXT.squish
            Using `super` is now deprecated. We're aiming to removing as much
            meta-programming as possible. Please use the `render_instance`
            method instead. This will be removed in 0.3.0.
          TEXT

          render_instance object
        end

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
