Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  resources :watches do
    resources :rentals, only: %i[new create update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  get "/rent_requests", to: "pages#rent_requests"
  # Defines the root path route ("/")
  # root "articles#index"
end
