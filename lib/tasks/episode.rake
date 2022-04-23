namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 367
    movie = Movie.find_or_create_by(imdb_id: "tt2463208", letterboxd_id: "the-adam-project")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt6710474", letterboxd_id: "everything-everywhere-all-at-once"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0094625", letterboxd_id: "akira"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0060586", letterboxd_id: "fighting-elegy"}
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
