class AddColToParticipant < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :role_id, :integer
    add_column :participants, :event_id, :integer
    add_column :participants, :user_id, :integer
  end
end
