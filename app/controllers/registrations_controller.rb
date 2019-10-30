class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)
      render json: { created: true, errors: [] }
    else
      clean_up_passwords resource
      render json: { created: false, errors: resource.errors.full_messages }
    end
  end

  def update
    super
  end

  def sign_up_params
    params.fetch(:user).permit([:password, :password_confirmation, :email, :first_name, :last_name])
  end
end
