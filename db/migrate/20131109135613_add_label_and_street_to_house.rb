class AddLabelAndStreetToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :label, :string
    add_column :houses, :street, :text
    add_column :houses, :user_id, :integer
  end
end
