class ApplicationController < ActionController::Base

    acts_as_token_authentication_handler_for User, fallback_to_devise: false
    respond_to :json, :html
    protect_from_forgery with: :null_session
end
