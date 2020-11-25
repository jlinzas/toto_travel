Rails.application.routes.draw do
resources :spaceships
resources :users, only: [:show] do
  resources :orders, only: [:new, :create]
end
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
