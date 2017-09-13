class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start_date_time, null: false
      t.datetime :end_date_time, null: false
      t.integer :sitter_id, null: false
      t.integer :owner_id

      t.timestamps
    end
  end
end
