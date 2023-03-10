Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/uikit", to: "pages#uikit"
  get "/map", to: "pages#map"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/update_booking_status", to: "bookings#update_booking_status_of_my_offering", as: :update_status
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :offerings, only: %i[index show new create destroy edit update] do
  resources :offerings do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show destroy]

  resources :bookings do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:index, :show, :edit, :update, :destroy]
end
