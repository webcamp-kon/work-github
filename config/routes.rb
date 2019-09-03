Rails.application.routes.draw do

  devise_for :managers, class_name: "Admin::Manager",controllers:{
    sessions: 'admin/managers/sessions',
    registrations: 'admin/managers/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :admin do
    resources :reviews,only:[:index,:show,:edit,:update]
    resources :order_histories,only:[:index,:show,:update,:create]
    resources :products,only:[:index,:show,:edit,:create,:new,:update,:destroy]
    resources :labels, only: [:index,:update,:new,:destroy]
    resources :genres, only: [:index,:update,:edit,:destroy]
    resources :reviews, only: [:index,:update,:edit,:destroy]
    resources :managers, only: [:update,:edit]
    resources :users,only:[:index,:show,:edit,:update, :destroy]
  end
  namespace :admin do
  get 'root/top', to: 'root#top'
  get 'products/:id/arrive', to: 'products#arrive',as: 'arrive_product'
6b4e7a9c75c7
  end
  
  resources :users,only:[:index,:show,:edit]
  get 'products/search' => 'products#search'
  get 'products/ranking' => 'products#ranking'
  resources :products, only: [:index,:show] do
    resources :reviews, only: [:index,:update,:edit,:destroy,:create]
  end
  resources :artists, only: [:index,:update,:edit,:destroy]
  get 'cart_items/confirm' => 'cart_items#confirm'
  get 'cart_items/completed' => 'cart_items#completed'
  resources :cart_items, only: [:index,:edit,:destroy]
  resources :order_histories, only: [:index]
  resources :labels, only: [:index,:update,:new,:destroy]
  resources :genres, only: [:index,:update,:edit,:destroy]
  resources :managers, only: [:update,:edit]
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
