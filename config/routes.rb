Rails.application.routes.draw do
  get 'info_pelicula/index'
  get 'sessions/new'
  namespace :api do
    resources :ratings, :defaults => { :format => 'json' }
  end
  resources :users
  resources :movies
  resources :sessions
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
  wash_out :plan
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  get '/showMovie' => 'users#showMovie'
  root "sessions#new"

end

