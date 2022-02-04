namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 361
    movie = Movie.find_or_create_by(imdb_id: "tt1137470", letterboxd_id: "accidental-love")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0084777", letterboxd_id: "tenebre"}
      ],
      Host.find(2) => [
        {imdb_id: "tt13453006", letterboxd_id: "red-rocket-2021"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0112857", letterboxd_id: "devil-in-a-blue-dress"}
      ],
      Host.find_or_create_by(name: "Matthew Silverstein") => [],
      Host.find_or_create_by(name: "Dave Jeser") => [
        {imdb_id: "tt0083624", letterboxd_id: "basket-case"}
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
