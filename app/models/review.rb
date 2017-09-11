class Review < ApplicationRecord
  belongs_to :event
  # belongs_to :user, through: :events
  # belongs_to :sitter, through: :events
  # belongs_to :owner, through: :events
end
