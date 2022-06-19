namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 372
    movie = Movie.find_or_create_by(imdb_id: "tt10954652", letterboxd_id: "old-2021")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt14549466", letterboxd_id: "crimes-of-the-future-2022"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0237534", letterboxd_id: "brotherhood-of-the-wolf"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0022183", letterboxd_id: "madchen-in-uniform"}
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
