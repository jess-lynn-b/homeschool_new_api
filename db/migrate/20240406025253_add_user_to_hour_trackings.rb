class AddUserToHourTrackings < ActiveRecord::Migration[7.1]
  def change
    add_reference :hour_trackings, :user, null: false, foreign_key: true
  end
end
