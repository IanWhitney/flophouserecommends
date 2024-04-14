namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 422
    movie = Movie.find_or_create_by(imdb_id: "tt3359350", letterboxd_id: "road-house-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0109447", letterboxd_id: "clifford"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0095904", letterboxd_id: "prison"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0093593", letterboxd_id: "on-the-silver-globe"},
        {imdb_id: "tt0043938", letterboxd_id: "the-prowler"}
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
