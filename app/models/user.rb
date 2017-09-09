class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets
  has_many :participants
  has_many :events, through: :participants
  has_many :roles, through: :participants
  validates :first_name, :last_name, presence: true
end
