class Event < ApplicationRecord

  belongs_to :sitter, class_name: :User

  belongs_to :owner, class_name: :User, optional: true
  has_many :reviews
  has_many :owner_reviews, ->{ where(type_reviews: 'owner') }, class_name: :Review
  has_many :sitter_reviews, ->{ where(type_reviews: 'sitter') }, class_name: :Review
  has_many :requests
  scope :closed, -> { where( 'end_date_time < ?', DateTime.now ) }
  # validates :distance, numericality: {only_integer: true}
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{street_address}, #{city}, #{state}"
  end

end
