class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    custom: '800x400#'
  }

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :name, :breed, :age, :size, :description, presence: true
end
