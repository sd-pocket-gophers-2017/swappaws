class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string :name, null: false
      t.integer :age, null: false
      t.string :breed, null: false
      t.string :size, null: false
      t.text :description, null: false
      t.text :photos, null: false

      t.timestamps
    end
  end
end
