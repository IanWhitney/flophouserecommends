namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 424
    movie = Movie.find_or_create_by(imdb_id: "tt0118665", letterboxd_id: "baby-geniuses")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0171685", letterboxd_id: "ratcatcher"}
      ],
      Host.find(2) => [
        {imdb_id: "tt16426418", letterboxd_id: "challengers"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0056680", letterboxd_id: "being-two-isnt-easy"}
      ],
      Host.find_or_create_by(name: "Linda Holmes") => [
        {imdb_id: "tt0082089", letterboxd_id: "body-heat"}
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
