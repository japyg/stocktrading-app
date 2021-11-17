Rails.application.routes.draw do
  devise_for :users
  
  match '/users',   to: 'users#index',   via: 'get'

  scope :admin do
    resources :users
    # resources :users_pending
  end

  

  get 'admin/users_pending' => 'users#index_pending'
  put 'admin/users_pending' => 'users#approved', as: 'approved'

  root "home#index"

end
