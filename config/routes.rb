Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipients do
    resources :locations, only: :create
    resources :items do
      resources :contributions, only: [:create, :new, :show, :update] do
         resources :payments, only: [:new, :create]
      end
    end
  end
  resources :locations, only: [:edit, :update, :delete]
    # resources :contributions, only: [:show]
end
