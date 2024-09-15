namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 433
    movie = Movie.find_or_create_by(imdb_id: "tt16375952", letterboxd_id: "dangerous-game-the-legacy-murders")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0300620", letterboxd_id: "so-close"}
      ],
      Host.find(2) => [
        {imdb_id: "tt11301886", letterboxd_id: "rebel-ridge"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0071381", letterboxd_id: "celine-and-julie-go-boating"}
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
