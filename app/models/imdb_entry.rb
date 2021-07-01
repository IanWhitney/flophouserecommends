class ImdbEntry
  attr_reader :title, :poster_uri

  def self.build(imdb_id)
    url = URI("http://omdbapi.com/?apikey=#{ENV["OMDBAPIKEY"]}&i=#{imdb_id}")
    json = JSON.parse(Net::HTTP.get(url))
    new(json)
  end

  def initialize(imdb_data)
    self.title = imdb_data.fetch("Title", "unknown")
    self.poster_uri = imdb_data.fetch("Poster", "unknown")
  end

  def has_poster?
    poster_uri.match?(/http/)
  end

  private

  attr_writer :title, :poster_uri
end
