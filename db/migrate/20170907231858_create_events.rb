class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :location, null: false
      t.datetime :start_date_time, null: false
      t.datetime :end_date_time, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
