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
  validates_presence_of :start_date, :end_date

  validate :end_date_is_after_start_date

  ########
  private
  ########

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "cannot be before start date")
    end
  end
  
  def full_street_address
    "#{street_address}, #{city}, #{state}"
  end

end
