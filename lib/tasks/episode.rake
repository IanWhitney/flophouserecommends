namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 459
    movie = Movie.find_or_create_by(imdb_id: "tt13186306", letterboxd_id: "war-of-the-worlds-2025")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0070916", letterboxd_id: "wicked-wicked"}
      ],
      Host.find(2) => [
        {imdb_id: "tt26581740", letterboxd_id: "weapons-2025"}
      ],
      Host.find(3) => [
        {imdb_id: "tt20212786", letterboxd_id: "the-shrouds"}
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
