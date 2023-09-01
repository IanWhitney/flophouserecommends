namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 403
    movie = Movie.find_or_create_by(imdb_id: "tt0120891", letterboxd_id: "wild-wild-west")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0387898", letterboxd_id: "cache"}
      ],
      Host.find(2) => [
        {imdb_id: "tt21440780", letterboxd_id: "how-to-blow-up-a-pipeline"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0068924", letterboxd_id: "marjoe"}
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
