namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 435
    movie = Movie.find_or_create_by(imdb_id: "tt9682428", letterboxd_id: "night-swim-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt21097228", letterboxd_id: "a-different-man"}
      ],
      Host.find(2) => [
        {imdb_id: "tt17526714", letterboxd_id: "the-substance"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0039080", letterboxd_id: "the-verdict"}
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
