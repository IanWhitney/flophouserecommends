class Recommendation < ApplicationRecord
  belongs_to :episode
  belongs_to :host
  belongs_to :movie
end
