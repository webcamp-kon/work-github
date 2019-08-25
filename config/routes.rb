Rails.application.routes.draw do
  devise_for :managers
  devise_for :users
  get 'products/search' => 'products#search'
  get 'products/ranking' => 'products#ranking'
  resources :products, only: [:index,:show]
  resources :artists, only: [:index,:update,:edit,:destroy]
  resources :labels, only: [:index,:update,:edit,:destroy]
  resources :genres, only: [:index,:update,:edit,:destroy]
  resources :reviews, only: [:index,:update,:edit,:destroy]
  resources :managers, only: [:update,:edit]
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
