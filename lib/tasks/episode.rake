namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 429
    movie = Movie.find_or_create_by(imdb_id: "tt13964390  ", letterboxd_id: "under-paris")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt22048412", letterboxd_id: "maxxxine"}
      ],
      Host.find(2) => [
        {imdb_id: "tt23468450", letterboxd_id: "longlegs"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0090271", letterboxd_id: "wolfs-hole"}
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
