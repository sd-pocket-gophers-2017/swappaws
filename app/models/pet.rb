class Pet < ApplicationRecord
  belongs_to :owner, foreign_key
end
