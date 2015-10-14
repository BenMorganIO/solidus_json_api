module Spree
  module Api
    module V2
      class BaseController < Spree::Api::BaseController
        include Spree::Api::V2::Renderable

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
      end
    end
  end
end
