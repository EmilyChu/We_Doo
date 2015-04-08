Rails.application.routes.draw do
  devise_for :users

  root 'application#home'

  resources :profile

  resources :dress do 
    member do 
      post    :vote
      post    :favorite
      patch   :unfavorite  #FIXME patch instead of delete? actually...don't need route??
    end
  end

  scope :bachelorette do 
    resources :posts do
      resources :comments do
      end
    end
    get '/yelp' => 'posts#search', as: 'search_yelp'
  end

  resources :schedule
  resources :availabilities
  resources :budget , only: [:index, :update, :create, :destroy]
end
