class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :ratings
end
