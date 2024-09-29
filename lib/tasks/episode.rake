namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 434
    movie = Movie.find_or_create_by(imdb_id: "tt0294880", letterboxd_id: "robot-in-the-family")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0082966", letterboxd_id: "the-house-by-the-cemetery"}
      ],
      Host.find(2) => [
        {imdb_id: "tt15893750", letterboxd_id: "rye-lane"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0250323", letterboxd_id: "the-deep-end"}
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
