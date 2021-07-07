Rails.application.routes.draw do
  resources :users

  patch "customer_menuitems", to: "users#updateaddress", as: :address

  get "/", to: "home#index"
  # get "users/new" => "users#new"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  post "/customer_details" => "users#owner", as: :add_owner

  post "/add_clerk" => "users#clerk", as: :addingclerk

  #menu category
  resources :menu_categories
  resources :menu_items

  put "customer_details" => "orders#update", as: :addstatus

  get "/customer_page" => "customer_pages#index", as: :customer_menupage
  get "/customer_menuitems" => "customer_items#index", as: :customer_menuitems

  patch "/menu_categories" => "menu_categories#updatemenustatus", as: :updatemenucategories
  patch "/menu_items" => "menu_items#updateitemstatus", as: :updateitemstatus

  resources :cart_items
  resources :orders
  resources :order_items
  resources :customer_details
  resources :show_carts
  resources :customer_dashboards
  resources :clerk_orders
end
