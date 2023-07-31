namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 401
    movie = Movie.find_or_create_by(imdb_id: "tt20768712", letterboxd_id: "book-club-the-next-chapter")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [],
      Host.find(2) => [],
      Host.find(3) => [
        {imdb_id: "tt0125118", letterboxd_id: "the-girl-chewing-gum"}
      ]
    }

    x.each do |host, recs|
      episode.find_or_create_host(host)
      recs.each do |rec|
        movie = Movie.find_or_create_by(rec)
        Recommendation.find_or_create_by(episode: episode, host: host, movie: movie)
      end
    end
  end
end
