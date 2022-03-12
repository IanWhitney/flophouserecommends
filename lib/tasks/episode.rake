namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 364
    movie = Movie.find_or_create_by(imdb_id: "tt10333426", letterboxd_id: "bliss-2021")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0093605", letterboxd_id: "near-dark"}
      ],
      Host.find(2) => [
        {imdb_id: "tt1736633", letterboxd_id: "oslo-august-31st"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0105508", letterboxd_id: "swoon"}
      ],
      Host.find_or_create_by(name: "Chuck Bryant") => [
        {imdb_id: "tt0093029", letterboxd_id: "five-corners"}
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
