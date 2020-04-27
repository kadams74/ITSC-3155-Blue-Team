class Movie < ApplicationRecord
    has_many :reviews
    has_many :ratings
end
