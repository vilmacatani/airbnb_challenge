Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/uikit", to: "pages#uikit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :offerings, only: %i[index show new create destroy edit update] do
  resources :offerings do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show destroy]
   end
    resources :bookings do
    resources :reviews, only: [:new]
    end

    resources :bookings do
      resources :reviews, only: [:new, :create]
    end
    resources :reviews, only: [:destroy]
    resources :reviews, only: [:show, :edit, :update, :destroy]
    end

  end
