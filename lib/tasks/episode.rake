namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 454
    movie = Movie.find_or_create_by(imdb_id: "tt5779228", letterboxd_id: "the-garfield-movie")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0112389", letterboxd_id: "the-thief-and-the-cobbler"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0095389", letterboxd_id: "jacks-back"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0057710", letterboxd_id: "an-actors-revenge"}
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
