namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 391
    movie = Movie.find_or_create_by(imdb_id: "tt0090887", letterboxd_id: "critters")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0105665", letterboxd_id: "twin-peaks-fire-walk-with-me"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0112471", letterboxd_id: "before-sunrise"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0077613", letterboxd_id: "girlfriends-1978"}
      ],
      Host.find_or_create_by(name: "Steven Kostanski") => [
        {imdb_id: "tt0097429", letterboxd_id: "ghoulies-iii-ghoulies-go-to-college"}
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
