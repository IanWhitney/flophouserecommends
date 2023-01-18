namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 387
    movie = Movie.find_or_create_by(imdb_id: "tt6443346", letterboxd_id: "black-adam")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt2361509", letterboxd_id: "the-intern-2015"}
      ],
      Host.find(2) => [
        {imdb_id: "tt19770238", letterboxd_id: "aftersun"}
      ],
      Host.find(3) => [
        {imdb_id: "tt11813216", letterboxd_id: "the-banshees-of-inisherin"}
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
