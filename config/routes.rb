Rails.application.routes.draw do
  devise_for :users

  root 'application#home'

  resources :profile
  resources :dress do 
    member do 
      post  :vote
      post    :favorite
      delete  :unfavorite
    end
  end

  resources :posts do
    resources :comments do
    end
  end

end
