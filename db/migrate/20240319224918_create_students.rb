class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :DOB
      t.string :gender
      t.integer :core_hrs_logged
      t.integer :noncore_hrs_logged
      t.references :parent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
