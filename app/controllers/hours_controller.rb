class HoursController < ApplicationController
  before_action :set_hour_tracking, only: [:show]

  def index
    hour_trackings = HourTracking.all
    render json: hour_trackings
  end

  def create
    hour = Hour.new(hour_params)
    if hour.save
      render json: { message: 'Hour created successfully'}, status: :created
    else
      render json: { error: 'Failed to create hours'}, status: :unprocessable_entity
    end
  end

# GET /hour_trackings
  def show
    render json: hour_tracking
  end
#PATH/PUT /hour_trackings
  def update
    if @hour_tracking.update(hour_params)
      render json: @hour_tracking
    else
      render json: @hour_tracking.errors, status: :unprocessable_entity
    end
  end


  private

  def set_hour_tracking
    @hour_tracking = HourTracking.find(params[:id])
  end

  def hour_params
    params.require(:hour_tracking).permit(:date, :task, :hours, :minutes, :notes)
  end
end