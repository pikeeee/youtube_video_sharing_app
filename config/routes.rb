# frozen_string_literal: true

Rails.application.routes.draw do
  root "videos#index"

  resources :users, only: [:create, :show]
  resources :videos, only: [:create, :update, :destroy]

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/share', to: 'videos#new'

  resource :sessions, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end