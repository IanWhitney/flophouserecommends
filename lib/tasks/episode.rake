namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 360
    movie = Movie.find_or_create_by(imdb_id: "tt11214590", letterboxd_id: "house-of-gucci")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt8847712", letterboxd_id: "the-french-dispatch"}
      ],
      Host.find(2) => [
        {imdb_id: "tt10293406", letterboxd_id: "the-power-of-the-dog"}
      ],
      Host.find(3) => [
        {imdb_id: "tt8847712", letterboxd_id: "the-french-dispatch"}
      ],
      Host.find_or_create_by(name: "Audrey Lazaro") => [
        {imdb_id: "tt0326977", letterboxd_id: "im-not-scared"}
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
