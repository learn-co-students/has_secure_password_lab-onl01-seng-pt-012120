Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :welcome, only: [:new]
  resources :sessions, only: [:new, :create]
end
