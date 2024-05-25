namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 425
    movie = Movie.find_or_create_by(imdb_id: "tt0242653", letterboxd_id: "the-matrix-revolutions")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt12818328", letterboxd_id: "hundreds-of-beavers"}
      ],
      Host.find(2) => [
        {imdb_id: "tt15574270", letterboxd_id: "i-saw-the-tv-glow"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0207050", letterboxd_id: "regrouping"}
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
