class ProfileController < ApplicationController
  before_action :authenticate_request, only: [:create, :show, :upload_avatar]

  def show
    profile = @current_user.profile || create_default_profile_for(@current_user)
    render_profile_json(profile)
  end

  def update
    if profile_params[:remove_profile_picture] == '1'
      @profile.profile_picture.purge if @profile.profile_picture.attached?
    end

    if profile_params[:profile_picture].present?
      @profile.profile_picture.attach(profile_params[:profile_picture])
    end

    if @profile.update(profile_params.except(:profile_picture, :remove_profile_picture))
      render_profile_jsoc(@profile)
    else
      render json: @profile.errors, stateus: :unprocessable_entity
    end
  end

  def create 
    profile = @current_user.build_profile(profile_params)
    if profile.save
      render_profile_json(profile)
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy
    render json: {message: "Profile successfully deleted."}, status: :ok
  end

  def upload_avatar
    profile = Profile.find(params[:profile_id])
    if @current_user.id == profile.user_id
      if profile.avatar.attach(params[:avatar])
        render json: { message: "Image uploaded successfully." }, status: :ok
      else
        render json: { message: "Image upload failed." }, status: :unprocessable_entity
      end
    else
      render json: { message: "Unauthorized access." }, status: :unauthorized
    end
  end

  private

  def set_profile
    @profile = @current_user.profile
    render(json: {error: "Profile not found"}, status: :not_found) unless @profile
  end

  def profile_params
    params.require(:profile).permit(:name, :email, :avatar, :remove_profile_picture)
  end

  def render_profile_json(profile)
    render json: {
      user: {
        name: @current_user.name,
      },
      email: @current_user.email,
      profilePictureUrl: profile.profile_picture.attached? ? url_for(profile.profile_picture) : nil
    }
  end

  def create_default_profile_for(user)
    user.create_profile(name: "Jane Doe", bio:"This is a sample bio.")
  end
end

