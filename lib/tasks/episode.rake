namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 449
    movie = Movie.find_or_create_by(imdb_id: "tt7766378", letterboxd_id: "the-electric-state")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt6874690", letterboxd_id: "the-rule-of-jenny-pen"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0300214", letterboxd_id: "morvern-callar"}
      ],
      Host.find(3) => [
        {imdb_id: "tt2008009", letterboxd_id: "the-clock-2010"}
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
