Spree::Core::Engine.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v2 do
      resources :countries, only: [:index, :show] do
        resources :states, only: [:index, :show]
      end

      resources :images, only: [:index, :show] do
        resource :product, :variant, only: :show
      end

      resources :line_items, only: :create

      resources :option_types, only: [:index, :show] do
        resources :option_values, :products, only: [:index, :show]
      end

      resources :option_values, only: [:index, :show] do
        resource :option_type, only: :show
        resources :variants, only: [:index, :show]
      end

      resources :orders, only: [:index, :show]

      resources :prices, only: [:index, :show] do
        resource :variant, :product, only: :show
      end

      resources :products, only: [:index, :show] do
        resources :option_types, :variants, :images, only: [:index, :show]
      end

      resources :states, only: [:index, :show] do
        resource :country, only: :show
      end

      resources :taxonomies, only: [:index, :show] do
        resources :taxons, only: [:index, :show]
      end

      resources :taxons, only: [:index, :show] do
        resources :children, :products, only: [:index, :show]
        resource :parent, only: :show, controller: 'taxons'
        resource :taxonomy, only: :show
      end

      resources :variants, only: [:index, :show] do
        resources :prices, :option_values, :images, only: [:index, :show]
        resource :product, only: :show
      end
    end
  end
end
