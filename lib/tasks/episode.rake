namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 405
    movie = Movie.find_or_create_by(imdb_id: "tt0104702", letterboxd_id: "legend-of-the-roller-blade-seven")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0101660", letterboxd_id: "the-dark-backward"}
      ],
      Host.find(2) => [],
      Host.find(3) => [
        {imdb_id: "tt0077157", letterboxd_id: "american-boy-a-profile-of-steven-prince"}
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
