class Request < ApplicationRecord
  belongs_to :event, optional: true
  has_one :sitter, through: :events
  belongs_to :owner, class_name: :User
end
