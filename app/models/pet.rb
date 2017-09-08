class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  validates :name, :breed, :age, :size, :photos, :description, :photos, presence: true
end
