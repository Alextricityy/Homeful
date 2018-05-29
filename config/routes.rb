Rails.application.routes.draw do
  get 'location/create'
  get 'location/edit'
  get 'location/update'
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipients do
    resources :locations
    resources :items, except: [:new]
  end
end
