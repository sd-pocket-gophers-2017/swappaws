class AddPendingToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :pending, :boolean, default: true
  end
end
