namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 374
    movie = Movie.find_or_create_by(imdb_id: "tt1798632", letterboxd_id: "firestarter-1")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0396752", letterboxd_id: "nanny-mcphee"}
      ],
      Host.find(2) => [
        {imdb_id: "tt15218000", letterboxd_id: "fire-island-2022"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0055499", letterboxd_id: "through-a-glass-darkly"}
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
