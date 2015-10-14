# Changelog

## 0.2.0

*   Calling `super` inside fo `#index` and `#show` actions is now deprecated.
    Since these are methods that are meant to be called, they have been renamed to `#render_collection` and `#render_instance`.

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   Added support for [Solidus](https://github.com/solidusio/solidus) has been added.

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   In some instances, you would like to use the helper methods provided by the Spree V2 API, but unable to extend from the controller.
    The render methods have been moved to a concern.
    If you would like to include them in a controller without having to extend from the `Spree::Api::V2::BaseController`, then:

    ```ruby
    module Api
      class MyController < Api::BaseController
        # include the concern
        include Spree::Api::V2::Renderable

        # example usage of rendering all products without calling
        # +render_instance+ but providing page detail information that conforms
        # to the JSON API spec.
        def index
          render json: @products, meta: { page: page_details(@products) }
        end
      end
    end
    ```

    [Ben A. Morgan](https://github.com/BenMorganIO)

## 0.1.0

Initial Release
