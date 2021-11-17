Rails.application.routes.draw do
  resources :trade_functions
  devise_for :users
  
  scope :admin do
    resources :users, except: [:destroy]
  end
  match '/users',   to: 'users#index',   via: 'get'

  root "home#index"
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
