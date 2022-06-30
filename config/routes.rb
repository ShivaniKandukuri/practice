Rails.application.routes.draw do
  root to:'pages#index'
  devise_for :models
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :articles
    end
  end
  resources :sessions
  get 'login',to:'sessions#new'
  post 'login',to:'sessions#create'
  delete 'logout',to:"sessions#destroy"
  resources :offices do
    member do
      get :cabins
    end
  end
  resources :cabins
end
