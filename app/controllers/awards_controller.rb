class AwardsController < ApplicationController
  before_action :authenticate_request, only: [ :create]

  def index
    @awards = Award.all
    render json: serialize_awards(@awards)
  end

   #GET/SHOW
  def show
    award = Award.find(params[:id])
    render json: serialize_award(award)
  end

  def create
    @award = Award.new(title: params[:title], description: params[:description], user_id: @current_user.id)
    @award.images.attach(params[:images])
    puts @awards
  
    if @award.save!
      render json: { message: 'Award created successfully', award: serialize_award(@award)}, status: :created
    else
      render json: { error: 'Failed to create award' }, status: :unprocessable_entity
    end
  end

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
      params.permit(:title, :description, images: [])
    end
    
    def serialize_award(award)
      {
        id: award.id,
        title: award.title,
        description: award.description,
        image_url: award_image_url(award)
      }
    end

    def serialize_awards(awards)
      awards.map { |award| serialize_award(award) }
    end

    def award_image_url(award)
      if award.images.attached?
        rails_blob_url(award.images.first)
      else
        nil # Handle case where no image is attached
      end
    end

    def find_award
      @award = Award.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Award not found' }, status: :not_found
    end
end