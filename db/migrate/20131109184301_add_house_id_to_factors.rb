class AddHouseIdToFactors < ActiveRecord::Migration
  def change
    add_column :factors, :house_id, :integer
    add_column :factors, :value, :string
  end
end
