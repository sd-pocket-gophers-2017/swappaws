class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets
  has_many :events
  validates :first_name, :last_name, presence: true
  has_many :reviews, through: :events
  has_many :

end
