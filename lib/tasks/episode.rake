namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 406
    movie = Movie.find_or_create_by(imdb_id: "tt0089200", letterboxd_id: "ghoulies")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt14509110", letterboxd_id: "no-one-will-save-you"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0115685", letterboxd_id: "the-birdcage"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0053579", letterboxd_id: "late-autumn"}
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
