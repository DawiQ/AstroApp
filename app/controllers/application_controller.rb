# class ApplicationController < ActionController::Base
#  before_action :authenticate_request
#   attr_reader :current_user
#
#   private
#
#   def authenticate_request
#     binding
#     @current_user = AuthorizeApiRequest.call(request.headers).result
#     render json: { error: 'Not Authorized' }, status: 401 unless @current_user
#   end
# end

class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  respond_to :json, :html
  protect_from_forgery with: :null_session
end
