namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 428
    movie = Movie.find_or_create_by(imdb_id: "tt23137904", letterboxd_id: "rebel-moon-part-two-the-scargiver")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0116831", letterboxd_id: "last-man-standing"}
      ],
      Host.find(2) => [
        {imdb_id: "tt12037194", letterboxd_id: "furiosa-a-mad-max-saga"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0083866", letterboxd_id: "et-the-extra-terrestrial"},
        {imdb_id: "tt0085852", letterboxd_id: "liquid-sky"}
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
