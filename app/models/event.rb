class Event < ApplicationRecord

  belongs_to :owner, class_name: :User
  belongs_to :sitter, class_name: :User
  has_many :participants
  has_many :pets, through: :user

  validates :location, :start_date_time, :end_date_time, presence: true


  scope :closed, -> {where("start_date_time < ?", [DateTime.now])}

  # def end_date
  #   errors.add( :start_date_time, "can't be after end of the event") if end_date_time < start_date_time
  # end

  def future_date
    errors.add( :start_date_time, "can't be in the past") if start_date_time && start_date_time < DateTime.now
  end

  belongs_to :user, optional: true

end
