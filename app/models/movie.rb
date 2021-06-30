class Movie < ApplicationRecord
  has_many :episodes
  has_many :recommendations

  before_save :populate

  private

  def populate
    return nil if title.present?
    return nil unless imdb_id.present?

    url = URI("http://omdbapi.com/?apikey=#{ENV["OMDBAPIKEY"]}&i=#{imdb_id}")
    self.title = JSON.parse(Net::HTTP.get(url))["Title"]
    nil
  end
end
