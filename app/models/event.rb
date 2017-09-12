class Event < ApplicationRecord
  belongs_to :sitter, class_name: :User, optional: true
  belongs_to :owner, class_name: :User, optional: true
  has_many :reviews
  geocoded_by :full_street_address
  after_validation :geocode


  def full_street_address
    "#{street_address}, #{city}, #{state}"
  end
end
