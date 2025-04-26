namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 450
    movie = Movie.find_or_create_by(imdb_id: "tt14914430", letterboxd_id: "unfrosted")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0079336", letterboxd_id: "the-in-laws"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0203119", letterboxd_id: "sexy-beast"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0235327", letterboxd_id: "dark-days"}
      ],
      Host.find(58) => [
        {imdb_id: "tt0116451", letterboxd_id: "gridlock"}
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
