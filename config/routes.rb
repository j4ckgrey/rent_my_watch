Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  resources :watches do
    resources :rentals, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  # Defines the root path route ("/")
  # root "articles#index"
end
