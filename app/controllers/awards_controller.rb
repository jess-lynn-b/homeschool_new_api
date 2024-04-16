class AwardsController < ApplicationController
  before_action :authenticate_request, only: [:create]

  def index
    @award = Award.all
    render json: @award, include: { images_attachments: { include: :blob}}
  end

  def create
    # puts params
    # @award = Award.new(award_params, user_id: @current_user.id)
    @award = Award.new(title: params[:title], description: params[:description], user_id: @current_user.id)
    @award.images.attach(params[:images])
    puts @award
  
    if @award.save!
      render json: { message: 'Award created successfully'}, status: :created
    else
      render json: { error: 'Failed to create award' }, status: :unprocessable_entity
    end
  end

  #GET/SHOW
  def show
    @award = Award.find(params[:id])
    render json: awards 
  end
  #PUT

  #DELETE /award/:id
  def destroy
    @award = Award.find(params[:id])
    if @award.destroy
      render json: { message: 'Award deleted successfully'}, status: :ok
    else
      render json: {error: 'Failed to delete award'}, status: :unprocessable_entity
    end
  end

  private
    def award_params
      params.permit(:title, :description, :images)
    end

    def set_awards
      @awards = Award.find(params)
    end
end