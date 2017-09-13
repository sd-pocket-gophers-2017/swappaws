class AddLongitudeAndLatitudeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :street_address, :string, null: false
    add_column :events, :city, :string, null: false
    add_column :events, :state, :string, null: false
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
