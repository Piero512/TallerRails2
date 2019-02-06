Rails.application.routes.draw do
  namespace :api do
    resources :ratings, :defaults => { :format => 'json' }
  end
  resources :users
  resources :movies
  scope '/api'do
    get '/ratings.json' => 'api/ratings#index'
    post '/ratings.json' => 'api/ratings#create'
    scope '/ratings' do
      get 'new.json' => 'api/ratings#new'
      get '/:id/edit.json' => 'api/ratings#edit'
      get '/:id/show.json'=> 'api/ratings#show'
      patch '/:id/update.json' => 'api/ratings#update'
      put '/:id/update.json' => 'api/ratings#update'
      delete '/:id/destroy.json'=> 'api/ratings#destroy'
    end
  end
  #mount Ratings::API => "/api/ratings"
  #mount Movies::API => "/api/movies"
  get "/top10" => "top10#index" 
  root "api/ratings#index"
  wash_out :plan
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

