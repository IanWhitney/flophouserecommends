class Episode < ApplicationRecord
  belongs_to :movie, optional: true
  has_and_belongs_to_many :hosts
  has_many :recommendations
end
