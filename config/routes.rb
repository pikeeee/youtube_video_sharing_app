# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create show]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  root "videos#index"
  resources :videos, only: %i[new create update destroy]
  get '/share', to: 'videos#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
