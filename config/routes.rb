Rails.application.routes.draw do

  root 'user_sessions#new'

  get :profile, to: 'users#show'

  namespace :admin do
    root 'users#index'
    resources :users, :chats
  end

  namespace :manager do
    root 'users#index'
    resources :users, :chats
  end

  namespace :client do
    root 'chats#show'
  end

  resources :user_sessions
  get :logout, to: 'user_sessions#destroy'
  get :login, to: 'user_sessions#new'
end
