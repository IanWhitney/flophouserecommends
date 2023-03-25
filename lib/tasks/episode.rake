namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 392
    movie = Movie.find_or_create_by(imdb_id: "tt13610562", letterboxd_id: "the-bubble-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0086154", letterboxd_id: "psycho-ii"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0093415", letterboxd_id: "light-of-day"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0070460", letterboxd_id: "day-for-night"},
        {imdb_id: "tt0105619", letterboxd_id: "the-heroic-trio"}
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
