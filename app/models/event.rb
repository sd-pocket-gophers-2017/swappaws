class Event < ApplicationRecord
  belongs_to :sitter, class_name: :User, optional: true
  belongs_to :owner, class_name: :User, optional: true
  has_many :reviews
  has_many :requests

  scope :closed, -> { where( 'end_date_time < ?', DateTime.now ) }

end
