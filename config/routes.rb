Rails.application.routes.draw do
  devise_for :users
  get 'commentss/new'
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end
end
