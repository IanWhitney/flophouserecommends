class Movie < ApplicationRecord
  has_many :episodes
  has_many :recommendations
end
