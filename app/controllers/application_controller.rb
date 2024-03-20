class ApplicationController < ActionController::API
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split('').last if header
    begin
      decoded = JWT.decoded(header, Rails.application.credentials.secret_key_base).first
      @current_user = User.find(decoded['username'])
    rescue JWT::ExpiredSignature
      render json: {error: 'Token has expired'}, status: :unauthorized
    rescue JWT::DecodeError
      render json: {errors: 'Unauthorized'}, status: :unauthorized
    end
  end
end
