class CreateHours < ActiveRecord::Migration[7.1]
  def change
    create_table :hours do |t|
      t.date :date
      t.string :task
      t.integer :hours
      t.integer :minutes
      t.text :notes
      t.timestamps
    end
  end
end
