class Event < ApplicationRecord
  belongs_to :sitter, class_name: :User, optional: true
  belongs_to :owner, class_name: :User, optional: true
  has_many :reviews
  has_many :requests
  scope :closed, -> { where( 'end_date_time < ?', DateTime.now ) }
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{street_address}, #{city}, #{state}"
  end
end
