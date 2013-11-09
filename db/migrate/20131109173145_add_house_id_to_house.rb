class AddHouseIdToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :house_id, :integer
  end
end
