Rails.application.routes.draw do
  root to: "pages#home"
  patch "rentals/:id", to: "rentals#update", as: :rental
  devise_for :users
  resources :watches do
    resources :rentals, only: %i[new create]
  end
  # resources :rentals, only: %i[]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  get "/rental_requests", to: "pages#rental_requests"
  # Defines the root path route ("/")
  # root "articles#index"
end
