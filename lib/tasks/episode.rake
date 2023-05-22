namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 396
    movie = Movie.find_or_create_by(imdb_id: "tt18079362", letterboxd_id: "80-for-brady")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt6791350", letterboxd_id: "guardians-of-the-galaxy-vol-3"}
      ],
      Host.find(2) => [
        {imdb_id: "tt13345606", letterboxd_id: "evil-dead-rise"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0067197", letterboxd_id: "the-hellstrom-chronicle"}
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
