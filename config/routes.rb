Rails.application.routes.draw do
  devise_for :users
  
  
  scope :admin do
    resources :users
    # resources :users_pending
  end

  
  # get '/admin/users_pending', to: 'users#index_pending', as: 'users_pending'
  # get '/admin/:id/users_pending', to: 'users#edit_pending', as: 'users_pending_edit'
  # patch '/admin/users_pending/:id', to: 'users#approved', as: 'approved'
  
  match '/users',   to: 'users#index',   via: 'get'

  get 'admin/users_pending' => 'users#index_pending'
  put 'admin/users_pending' => 'users#approved', as: 'approved'

  
  
  

  root "home#index"

end
