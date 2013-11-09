class AddContactAndEmailToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :contact, :string
    add_column :houses, :email, :string
  end
end
