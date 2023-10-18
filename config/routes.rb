Rails.application.routes.draw do
  root to: 'load#index'
	devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root to: 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :load, only: [:index]
  resources :users, only: [:index, :show]
end
