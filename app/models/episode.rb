class Episode < ApplicationRecord
  belongs_to :movie, optional: true
end
