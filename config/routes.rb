Rails.application.routes.draw do
  devise_for :users

  root 'application#home'

  resources :profile

  resources :dress do 
    member do 
      post    :vote
      post    :favorite
      delete  :unfavorite
    end
  end

  scope :bachelorette do 
    resources :posts do
      resources :comments do
      end
    end
    get '/yelp' => 'posts#search', as: 'search_yelp'
  end

  #resources :bridalshower

end
