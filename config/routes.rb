Rails.application.routes.draw do
  resources :ratings
  resources :users
  resources :movies
  mount Ratings::API => "/api/ratings"
  mount Movies::API => "/api/movies"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
