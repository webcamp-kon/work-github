Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :admin do
    resources :reviews,only:[:index,:show,:edit,:update,:destroy]
    resources :order_histories,only:[:index,:show,:update,:destroy,:edit]
    resources :products,only:[:index,:show,:edit,:create,:new,:update,:destroy,:arrive,:arrived]
    resources :artists, only: [:index,:new,:create,:edit,:update,:destroy]
    resources :labels, only: [:index,:new,:create,:edit,:update,:destroy]
    resources :genres, only: [:index,:new,:create,:edit,:update,:destroy]
    resources :managers,only:[:edit,:update]
    devise_for :managers,controllers: {
      sessions:      'admin/managers/sessions',
      passwords:     'admin/managers/passwords',
      registrations: 'admin/managers/registrations'
    }
    resources :users,only:[:index,:show,:edit,:update, :destroy]
  end
  namespace :admin do
  get 'root/top', to: 'root#top'
  get 'products/:id/arrive', to: 'products#arrive',as: 'arrive_product'
  patch 'products/:id/arrive', to: 'products#arrived',as: 'arrived_product'
  end
  resources :users,only:[:index,:show,:edit,:update]
  get 'users/leave' => 'users#leave'
  get 'products/search' => 'products#search'
  get 'products/ranking' => 'products#ranking'
  resources :products, only: [:index,:show] do
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:index,:update,:edit,:destroy,:create]
  end
  get 'cart_items/confirm' => 'cart_items#confirm'
  post 'cart_items/completed' => 'cart_items#completed'
  get 'cart_items/minus' => 'cart_items#minus'
  get 'cart_items/plus' => 'cart_items#plus'

  resources :cart_items, only: [:index,:edit,:destroy,:create,:new,:completed]
  resources :order_histories, only: [:index]
  resources :labels, only: [:index,:update,:new,:destroy]
  resources :genres, only: [:index,:update,:edit,:destroy]
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
