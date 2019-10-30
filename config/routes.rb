Rails.application.routes.draw do
  get 'events/', to: "events#index"
  get 'events/:id', to: "events#show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  get 'mobile_test', to: "test_endpoint#mobile_test"
  get 'mobile_auth_test', to: "test_endpoint#mobile_auth_test"
  devise_for :users, :controllers => {:registrations => "registrations"}
  post 'authenticate', to: 'authentication#authenticate'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
