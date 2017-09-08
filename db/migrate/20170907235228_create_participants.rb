class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.integer :roles_id, null: false
      t.integer :events_id, null: false
      t.integer :users_id, null: false

      t.timestamps
    end
  end
end
