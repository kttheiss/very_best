Rails.application.routes.draw do
  root :to => "dishes#index"
  resources :neighborhoods
  resources :unique_listings
  resources :bookmarks
  resources :users
  resources :venues
  resources :dishes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
