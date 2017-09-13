class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :full_street_address
  after_validation :geocode

  has_many :pets
  has_many :events_hosted, class_name: :Event, foreign_key: :sitter_id
  has_many :events_booked, class_name: :Event, foreign_key: :owner_id
  has_many :requests_created, class_name: :Request
  has_many :requests_pending, through: :events_hosted, source: :requests
  has_many :events
  has_many :reviews, through: :events

  has_attached_file :profile_photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  validates :first_name, :last_name, presence: true

  def full_street_address
    "#{street_address}, #{city}, #{state}"
  end
end
