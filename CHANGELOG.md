# Changelog

## 0.3.0

*   Drop Spree Support

    After trying to get the spree support working, I’ve concluded that its just
    not worth it. I know there’s a lot of you out there that really want this.
    If you truly need to keep using Spree, please fork this repo and make the
    necessary changes.

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   The project has been renamed from `spree_api_v2` to `solidus_json_api`.
    Since the Spree project is no longer maintained, then there's no reason to
    give Spree a second API version. This means that you need to update the
    following code:

    ```ruby
    ### Before ###

    # Gemfile
    gem 'spree_api_v2'

    # config/initializers/spree_api_v2.rb
    SolidusApiV2.setup do |config|
      config.parent_serializer = ApplicationSerializer
    end

    ### After ###

    # Gemfile
    gem 'solidus_json_api'

    # config/initializers/solidus_json_api.rb
    SolidusJsonApi.setup do |config|
      config.parent_serializer = ApplicationSerializer
    end
    ```

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   In Spree, you will receive an error if the stock is not sufficient when
    updating a line item. This is done in this project since the API requires
    it. However, when transition to Solidus, we discovered that this feature was
    constrained to the complete state. We've added a validation check before
    saving a line item. Please open an issue if you believe this to be an
    anti-pattern.

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   Removed `Spree::Order#considered_risky` from the JSON response since Solidus
    doesn't support this anymore.

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   `Spree::Variant#depth`, `Spree::Variant#width`, and `Spree::Variant#height`
    now return `null` instead of `""` when empty.

    ```json
    // Before
    {
      "type" : "spree_variant",
      "data" : {
        "attributes" : {
          "depth" : "",
          "width" : "",
          "height" : "",
          ...
        }
      }
    }

    // After
    {
      "type" : "spree_variant",
      "data" : {
        "attributes" : {
          "depth" : null,
          "width" : null,
          "height" : null,
          ...
        }
      }
    }
    ```

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   `Spree::LineItem#additional_tax_total` and `Spree::LineItem#adjustment_total`
    now return as strings instead of floats in the api:

    ```json
    // Before
    {
      "type" : "spree_line_item",
      "data" : {
        "attributes" : {
          "additional_tax_total" : 0,
          "adjustment_total" : 0.0,
          ...
        }
      }
    }

    // After
    {
      "type" : "spree_line_item",
      "data" : {
        "attributes" : {
          "additional_tax_total" : "0",
          "adjustment_total" : "0.0",
          ...
        }
      }
    }
    ```

    [Ben A. Morgan](https://github.com/BenMorganIO)

## 0.2.2

*   The parent serializer for `Spree::BaseSerializer` is now configurable.
    In some instances, you may have an `ApplicationSerializer`.
    To make the `Spree::BaseSerializer` use an `ApplicationSerializer` instead
    of the `ActiveModel::Serializer`:

    ```ruby
    # config/initializers/spree_api_v2.rb; or
    # config/initializers/solidus_api_v2.rb
    SpreeApiV2.setup do |config|
      config.parent_serializer = ApplicationSerializer
    end
    ```

    [Ben A. Morgan](https://github.com/BenMorganIO)

## 0.2.1

*   Fixes a bug where the user serializer wasn't extending from the `Spree::BaseSerializer` this is now fixed.

    [Ben A. Morgan](https://github.com/BenMorganIO)

## 0.2.0

*   Calling `super` inside fo `#index` and `#show` actions is now deprecated.
    Since these are methods that are meant to be called, they have been renamed to `#render_collection` and `#render_instance`.

    [Ben A. Morgan](https://github.com/BenMorganIO)

*   Added support for [Solidus](https://github.com/solidusio/solidus).

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
