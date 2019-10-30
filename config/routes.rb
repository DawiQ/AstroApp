Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  get 'mobile_test', to: "test_endpoint#mobile_test"
  devise_for :users,controllers: {
    registrations: 'v1/custom_devise/registrations',
  }
  # scope module: :v1 do
  #   devise_for :users, controllers: {
  #       registrations: 'v1/custom_devise/registrations',
  #       # confirmations: 'v1/custom_devise/confirmations',
  #       # sessions: 'v1/custom_devise/sessions'
  #   }
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
