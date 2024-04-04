class HoursController < ApplicationController
  def create 
    hours = Hours.new(hours_params)
    if hours.save
      render json: hours, status: :created
    else
      render json: hours.errors, status: :unprocessable_entity
    end
  end

  def index
    hour_trackings = HourTracking.all
    render json: hour_trackings
  end

  private

  def hours
    params.require(:hours).permit(:date, :task, :time, :hours, :minutes, :notes)
  end
end

  end
end
