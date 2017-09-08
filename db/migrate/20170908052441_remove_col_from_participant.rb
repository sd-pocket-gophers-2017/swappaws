class RemoveColFromParticipant < ActiveRecord::Migration[5.1]
  def change
    remove_column :participants, :roles_id
    remove_column :participants, :events_id
    remove_column :participants, :users_id
  end
end
