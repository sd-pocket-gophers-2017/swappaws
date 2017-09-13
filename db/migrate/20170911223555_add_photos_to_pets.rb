class AddPhotosToPets < ActiveRecord::Migration[5.1]
  def change
    add_attachment :pets, :photo
  end
end
