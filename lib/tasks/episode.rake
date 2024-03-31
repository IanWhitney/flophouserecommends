namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 421
    movie = Movie.find_or_create_by(imdb_id: "tt12412888", letterboxd_id: "sonic-the-hedgehog-2")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0082813", letterboxd_id: "butcher-baker-nightmare-maker"}
      ],
      Host.find(2) => [
        {imdb_id: "tt23137390", letterboxd_id: "immaculate-2024"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0074200", letterboxd_id: "bernice-bobs-her-hair"}
      ],
      Host.find(43) => [
        {imdb_id: "tt0092699", letterboxd_id: "broadcast-news"}
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
