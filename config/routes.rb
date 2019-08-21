Rails.application.routes.draw do
  # devise_for users
  get 'products/search' => 'products#search'
  get 'products/ranking' => 'products#ranking'
  resources :products, only: [:index,:show]
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
