namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 426
    movie = Movie.find_or_create_by(imdb_id: "tt0285462", letterboxd_id: "boat-trip")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0120032", letterboxd_id: "romy-and-micheles-high-school-reunion"}
      ],
      Host.find(2) => [
        {imdb_id: "tt30321146", letterboxd_id: "in-a-violent-nature"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0040723", letterboxd_id: "raw-deal"}
      ],
      Host.find(53) => [
        {imdb_id: "tt0077599", letterboxd_id: "gay-usa"}
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
