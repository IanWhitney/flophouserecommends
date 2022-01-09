namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 359
    movie = Movie.find_or_create_by(imdb_id: "tt9357050", letterboxd_id: "dear-evan-hansen")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt7740496", letterboxd_id: "nightmare-alley-2021"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0142001", letterboxd_id: "the-year-of-the-sex-olympics"}
      ],
      Host.find(2) => [
        {imdb_id: "tt10370710", letterboxd_id: "the-worst-person-in-the-world"}
      ],
      Host.find(38) => [
        {imdb_id: "tt11214590", letterboxd_id: "house-of-gucci"}
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
