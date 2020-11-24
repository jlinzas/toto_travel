Rails.application.routes.draw do
  get 'orders/new'
  get 'spaceships/index'
  get 'spaceships/new'
  get 'spaceships/show'
  get 'spaceships/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
