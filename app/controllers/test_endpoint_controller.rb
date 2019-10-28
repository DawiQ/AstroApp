class TestEndpointController < ApplicationController
  def mobile_test
    render json: { valid: true, errors: [] }
  end
end
