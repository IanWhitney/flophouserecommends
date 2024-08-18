namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 431
    movie = Movie.find_or_create_by(imdb_id: "tt11304740", letterboxd_id: "wish-2023")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0077904", letterboxd_id: "the-manitou"}
      ],
      Host.find(2) => [
        {imdb_id: "tt32203531", letterboxd_id: "frankie-freako"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0036172", letterboxd_id: "the-more-the-merrier"}
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
