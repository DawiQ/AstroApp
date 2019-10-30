class TestEndpointController < AstroController
  skip_before_action :authenticate_request, only: [:mobile_test]

  def mobile_test
    render json: { valid: true, errors: [] }
  end

  def mobile_auth_test
    render json: { valid: true, errors: [] }
  end
end
