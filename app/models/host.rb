class Host < ApplicationRecord
  has_and_belongs_to_many :episodes
  has_many :recommendations
end
