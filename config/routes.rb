Rails.application.routes.draw do
  namespace :admin do
    get 'order_histories/index'
    get 'order_histories/show'
    get 'order_histories/update'
    get 'order_histories/create'
  end
  namespace :admin do
    get 'products/index'
    get 'products/show'
    get 'products/edit'
    get 'products/create'
    get 'products/new'
    get 'products/arrive'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'product/index'
    get 'product/show'
    get 'product/edit'
    get 'product/create'
    get 'product/new'
    get 'product/arrive'
  end
  devise_for :managers
  devise_for :users
  get 'products/search' => 'products#search'
  get 'products/ranking' => 'products#ranking'
  resources :products, only: [:index,:show]
  resources :artists, only: [:index,:update,:edit,:destroy]
  get 'cart_items/confirm' => 'cart_items#confirm'
  get 'cart_items/completed' => 'cart_items#completed'
  resources :cart_items, only: [:index,:edit,:destroy]
  resources :order_histories, only: [:index]
  resources :labels, only: [:index,:update,:new,:destroy]
  resources :genres, only: [:index,:update,:edit,:destroy]
  resources :reviews, only: [:index,:update,:edit,:destroy]
  namespace :admin do

  end
  resources :managers, only: [:update,:edit]
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
