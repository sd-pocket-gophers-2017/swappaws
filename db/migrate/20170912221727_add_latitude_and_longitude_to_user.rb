class AddLatitudeAndLongitudeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :street_address, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
