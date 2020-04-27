class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  
  validates :stars, presence: true
end
