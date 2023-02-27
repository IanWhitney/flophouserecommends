namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 390
    movie = Movie.find_or_create_by(imdb_id: "tt13223398", letterboxd_id: "beast-2022-1")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0094169", letterboxd_id: "tough-guys-dont-dance"}
      ],
      Host.find(2) => [
        {imdb_id: "tt13434562", letterboxd_id: "a-wounded-fawn"}
      ],
      Host.find(3) => [
        {imdb_id: "tt1461238", letterboxd_id: "kurt-vonnegut-unstuck-in-time"},
        {imdb_id: "tt0069945", letterboxd_id: "dark-star"}
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
