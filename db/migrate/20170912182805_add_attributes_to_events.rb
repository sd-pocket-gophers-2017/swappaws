class AddAttributesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :pending, :boolean, default: true
    add_column :events, :pending_ids, :integer, array: true, default: []
  end
end
