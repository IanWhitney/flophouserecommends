namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 457
    movie = Movie.find_or_create_by(imdb_id: "tt14948432", letterboxd_id: "red-one")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt8233874", letterboxd_id: "extra-ordinary"}
      ],
      Host.find(2) => [
        {imdb_id: "tt26342662", letterboxd_id: "m3gan-20"}
      ],
      Host.find(79) => [
        {imdb_id: "tt0323944", letterboxd_id: "shattered-glass"}
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
