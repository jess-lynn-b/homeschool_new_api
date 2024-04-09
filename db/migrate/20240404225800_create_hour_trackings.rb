class CreateHourTrackings < ActiveRecord::Migration[7.1]
  def change
    create_table :hour_trackings do |t|

      t.timestamps
    end
  end
end
