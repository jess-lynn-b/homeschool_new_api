class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :credit
      t.string :catagory
      t.boolean :honors
      t.integer :hours_logged

      t.timestamps
    end
  end
end
