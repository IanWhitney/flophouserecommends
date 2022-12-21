namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 385
    movie = Movie.find_or_create_by(imdb_id: "tt10304142", letterboxd_id: "amsterdam-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0076637", letterboxd_id: "rolling-thunder"}
      ],
      Host.find(2) => [
        {imdb_id: "tt6367558", letterboxd_id: "double-lover"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0064781", letterboxd_id: "fruit-of-paradise"}
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
