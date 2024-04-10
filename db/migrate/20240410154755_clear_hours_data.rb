class ClearHoursData < ActiveRecord::Migration[7.1]
  def up
    Hour.delete_all
  end
  def change
  end
end
