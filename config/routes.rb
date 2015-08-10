Rails.application.routes.draw do

  root 'user_sessions#new'

  namespace :admin do
    root 'users#index'
    resources :users, :chats
  end

  namespace :manager do
    root 'users#index'
    resources :users, :chats
  end

  namespace :client do
    root 'users#show'
  end

  resources :user_sessions, only: [:new, :create, :destroy]

end
