Rails.application.routes.draw do
  devise_for :managers
  devise_for :users
  get 'products/search' => 'products#search'
  get 'products/ranking' => 'products#ranking'
  resources :products, only: [:index,:show]
  resources :artists, only: [:index,:update,:edit,:destroy]
<<<<<<< HEAD
  resources :labels, only: [:index,:update,:edit,:destroy]
=======
  get 'cart_items/confirm' => 'cartitems#confirm'
  get 'cart_items/conpleted' => 'cart_items#conpleted'
  resources :cart_items, only: [:index,:edit,:destroy]
  resources :order_histories, only: [:index]
  resources :labels, only: [:index,:update,:new,:destroy]
>>>>>>> 17c5c59b8c92bb621e12e5922f7991b1949a58cf
  resources :genres, only: [:index,:update,:edit,:destroy]
  resources :reviews, only: [:index,:update,:edit,:destroy]
  resources :managers, only: [:update,:edit]
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
