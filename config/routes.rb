Rails.application.routes.draw do

  root 'chat#index'

  get 'login' => "user_sessions#new", :as => :login
  post 'login' => "user_sessions#create", :as => :user_sessions
  get 'logout' => "user_sessions#destroy", :as => :logout

  get 'registration' => "users#new", :as => :new_user

  resources :users, :rooms, :messages

  get 'account' => "users#edit", :as => :account

end
