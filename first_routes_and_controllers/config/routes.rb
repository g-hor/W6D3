Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users

  resources :artworks

  resources :artwork_shares, only: [:create, :destroy]

  # get "/users/:user_id/artworks", to: "artworks#index"

  resources :users do
    resources :artworks, only: [:index]
  end

  # get '/users/new', to: 'users#new', as: 'new_user'

  # Defines the root path route ("/")
  # root "articles#index"
end
