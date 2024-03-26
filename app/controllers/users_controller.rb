class UsersController < ApplicationController
  before_action :authenticate_request, only: [:upload_image]
  def create 
    user = User.new(user_params)
    if user.save
      render json: user, status: :created 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def upload_image
    puts params[:user_id]
    # user = User.find(params[:user_id])
    if @current_user.image.attach(params[:image])
      render json: { message: "Image uploaded successfully." }, status: :ok
    else
      render json: { message: "Image upload failed." }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
