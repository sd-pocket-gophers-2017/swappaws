class AddAttributesToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :approved, :string, default: nil
  end
end
