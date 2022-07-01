Rails.application.routes.draw do
  root to:'pages#home'
  devise_for :models
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :articles
    end
    member do
      get :magazine
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
    collection do
      get :search_office
    end
  end
  resources :cabins
  resources :magazines
  resources :users do
    resources :magazines
  end
  resources :categories
end
