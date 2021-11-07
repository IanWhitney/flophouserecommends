namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 355
    movie = Movie.find_or_create_by(imdb_id: "tt7737640", letterboxd_id: "breaking-news-in-yuba-county")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0102709", letterboxd_id: "primal-rage"}
      ],
      Host.find(2) => [
        {imdb_id: "tt10944760", letterboxd_id: "titane"},
        {imdb_id: "tt15358226", letterboxd_id: "new-york-ninja"}
      ],
      Host.find(3) => [
        {imdb_id: "tt10796286", letterboxd_id: "dear-comrades"}
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
