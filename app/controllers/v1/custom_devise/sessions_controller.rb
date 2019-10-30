# class V1::CustomDevise::SessionsController < Devise::RegistrationsController
#   respond_to :json
#
#   # acts_as_token_authentication_handler_for User, fallback_to_devise: false
#   # skip_before_filter :authenticate_entity_from_token!, only: [:create]
#   # skip_before_filter :authenticate_entity!, only: [:create]
#
#   # POST /users/sign_in
#   def create
#     binding
#     allow_params_authentication!
#     self.resource = warden.authenticate!(sign_in_params)
#
#     reset_token resource
#     binding
#     render file: 'v1/custom_devise/sessions/create'
#   end
#
#
#   # DELETE /users/sign_out
#   def destroy
#     warden.authenticate!
#     reset_token current_user
#   end
#
#   private
#
#   def sign_in_params
#     params.fetch(:user).permit([:password, :email])
#   end
#
#   def reset_token(resource)
#     resource.authentication_token = nil
#     resource.save!
#   end
# end
