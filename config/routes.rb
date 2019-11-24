Rails.application.routes.draw do
  get 'comments/:id', to: 'comments#show'
  post 'comments', to: 'comments#create'
  put 'comments/:id', to: 'comments#update'
  delete 'comments/:id', to: 'comments#delete'
  get 'events/', to: "events#index"
  get 'events/:id', to: "events#show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  get 'mobile_test', to: "test_endpoint#mobile_test"
  get 'mobile_auth_test', to: "test_endpoint#mobile_auth_test"
  devise_for :users, :controllers => {:registrations => "registrations"}
  post 'authenticate', to: 'authentication#authenticate'
  get 'preferences', to: 'preferences#index'
  get 'my_preferences', to: 'preferences#get_my_preferences'
  post 'my_preferences', to: 'preferences#set_my_preferences'
  get 'my_events', to: 'events#my_events'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
