class Review < ApplicationRecord
  belongs_to :event
  has_many :sitters, through: :events
  has_many :owners, through: :events
end
