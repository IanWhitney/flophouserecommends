namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 363
    movie = Movie.find_or_create_by(imdb_id: "tt4995540", letterboxd_id: "being-the-ricardos")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt11466222", letterboxd_id: "jackass-forever"}
      ],
      Host.find(2) => [
        {imdb_id: "tt11196036", letterboxd_id: "the-card-counter"}
      ],
      Host.find(3) => [
        {imdb_id: "tt13087796", letterboxd_id: "im-your-man-2021"}
      ],
      Host.find_or_create_by(name: "Alison Rosen") => [
        {imdb_id: "tt0073747", letterboxd_id: "the-stepford-wives"}
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
