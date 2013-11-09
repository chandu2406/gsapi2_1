class AddNotesToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :Notes, :text
  end
end
