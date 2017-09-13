class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.text :note
      t.integer :owner_id
      t.integer :event_id

      t.timestamps
    end
  end
end
