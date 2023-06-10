namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 397
    movie = Movie.find_or_create_by(imdb_id: "tt12261776", letterboxd_id: "65")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt13521006", letterboxd_id: "beau-is-afraid"}
      ],
      Host.find(2) => [
        {imdb_id: "tt16419074", letterboxd_id: "air-2023"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0045009", letterboxd_id: "park-row"}
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
