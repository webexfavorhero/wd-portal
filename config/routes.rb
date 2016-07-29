Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"
  
  resources :fetch_ubersmith
  resources :orders
end
