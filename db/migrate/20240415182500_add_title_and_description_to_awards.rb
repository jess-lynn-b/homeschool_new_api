class AddTitleAndDescriptionToAwards < ActiveRecord::Migration[7.1]
  def change
    add_column :awards, :title, :string
    add_column :awards, :description, :text
  end
end
