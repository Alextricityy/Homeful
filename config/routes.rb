Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipients do
    resources :locations
    resources :items do
      resources :contributions, only: [:create, :new, :show] do
         resources :payments, only: [:new, :create]
      end
    end
  end
    # resources :contributions, only: [:show]
end
