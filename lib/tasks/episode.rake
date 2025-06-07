namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 453
    movie = Movie.find_or_create_by(imdb_id: "tt30788842", letterboxd_id: "love-hurts-2025")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt32378300", letterboxd_id: "summer-of-69-2025"}
      ],
      Host.find(2) => [
        {imdb_id: "tt26625693", letterboxd_id: "the-order-2024"}
      ],
      Host.find(3) => [
        {imdb_id: "tt14419140", letterboxd_id: "pee-wee-as-himself-1"}
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
