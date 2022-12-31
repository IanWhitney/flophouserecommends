namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 386
    movie = Movie.find_or_create_by(imdb_id: "tt0452681", letterboxd_id: "the-santa-clause-3-the-escape-clause")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt24248198", letterboxd_id: "adult-swim-yule-log"}
      ],
      Host.find(2) => [
        {imdb_id: "tt15528292", letterboxd_id: "the-big-4"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0057277", letterboxd_id: "the-big-city"}
      ],
      Host.find(53) => [
        {imdb_id: "tt12718300", letterboxd_id: "confess-fletch"}
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
