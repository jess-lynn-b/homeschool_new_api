class HoursController < ApplicationController
  before_action :set_hour_tracking, only: [:show]
  def index
    @hours = Hour.all
    render json: @hours
    # hour_trackings = HourTracking.all
    # render json: hour_trackings
  end

  def create
    @hour = Hour.new(hour_params)
    if @hour.save
      render json: { message: 'Hour created successfully'}, status: :created
    else
      render json: { error: @hour.errors.full_messages}, status: :unprocessable_entity
    end
  end

# GET /hour_trackings
  def show
    render json: hour_tracking
  end
#PATH/PUT /hour_trackings
  def update
    if @hour.update(hour_params)
      render json: @hour
    else
      render json: @hour.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hours/:id
  def destroy
    hour = Hour.find(params[:id])
    if hour.destroy
      render json: { message: 'Hour deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete hour' }, status: :unprocessable_entity
    end
  end

  private
  def hour_params
    params.require(:hour_tracking).permit(:date, :task, :hours, :minutes, :notes)
  end

  def set_hour_tracking
    @hour_tracking = HourTracking.find(params[:id])
  end
end