Rails.application.routes.draw do

  root 'demo#index'

  get 'client', to: 'demo#client'
  get 'manager_profile', to: 'demo#manager_profile'
  get 'manager_chats', to: 'demo#manager_chats'
  get 'client_profile', to: 'demo#client_profile'
  get 'clients', to: 'demo#clients'
  get 'manager', to: 'demo#manager'
  get 'admin', to: 'demo#admin'
  get 'chat', to: 'demo#chat'
  get 'login', to: 'demo#login'

  get 'client/index'

  get 'manager/index'

  get 'admin/index'

  #root 'main#index'

  #get 'login' => "user_sessions#new", :as => :login
  post 'login' => "user_sessions#create", :as => :user_sessions
  get 'logout' => "user_sessions#destroy", :as => :logout

  get 'registration' => "users#new", :as => :new_user

  resources :users, :chats, :messages

  get 'account' => "users#edit", :as => :account

end
