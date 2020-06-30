Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/home', to: "users#home", as: "home"
  root to: "users#home"

  resources :users, only: [:new, :create]
  get '/users/login', to: "users#login", as: "login"

  resources :sessions, only: [:create]

end
