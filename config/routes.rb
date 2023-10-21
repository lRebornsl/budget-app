Rails.application.routes.draw do
	devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'load#index', as: :unauthenticated_root
    end
  end

  resources :load, only: [:index]
  resources :users, only: [:index, :show] do
    resources :categories, only: [:index, :show, :new, :create] do
      resources :payments, only: [:index, :show, :new, :create]
    end
  end
end
