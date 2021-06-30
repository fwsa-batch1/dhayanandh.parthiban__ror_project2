Rails.application.routes.draw do
  resources :users
  get "/", to: "home#index"
  # get "users/new" => "users#new"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions

  #menu category
  resources :menu_categories
  resources :menu_items

end
