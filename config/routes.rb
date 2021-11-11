Rails.application.routes.draw do
  devise_for :users
  
  scope :admin do
    resources :users, except: [:destroy]
    resources :users_pending
  end
  match '/users',   to: 'users#index',   via: 'get'

  

  root "home#index"

end
