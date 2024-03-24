namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 420
    movie = Movie.find_or_create_by(imdb_id: "tt11057302", letterboxd_id: "madame-web")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0089017", letterboxd_id: "desperately-seeking-susan"},
        {imdb_id: "tt14671678"}
      ],
      Host.find(2) => [
        {imdb_id: "tt19637052", letterboxd_id: "love-lies-bleeding-2024"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0086429", letterboxd_id: "testament"}
      ],
      Host.find(5) => [
        {imdb_id: "tt14812782", letterboxd_id: "hit-the-road-2021"}
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
