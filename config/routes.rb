Rails.application.routes.draw do

  root 'user_sessions#new'

  namespace :admin do
    root 'main#index'
  end

  namespace :manager do
  end

  namespace :client do
  end

  resources :user_sessions, only: [:new, :create, :destroy]

end
