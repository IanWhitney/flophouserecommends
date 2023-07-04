namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 399
    movie = Movie.find_or_create_by(imdb_id: "tt6718170", letterboxd_id: "the-super-mario-bros-movie")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt13669038", letterboxd_id: "women-talking"}
      ],
      Host.find(2) => [
        {imdb_id: "tt9848536", letterboxd_id: "we-are-who-we-are"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0064994", letterboxd_id: "larks-on-a-string"}
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
