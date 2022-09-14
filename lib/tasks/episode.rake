namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 378
    movie = Movie.find_or_create_by(imdb_id: "tt18454132", letterboxd_id: "amityville-in-space")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt10276470", letterboxd_id: "work-it"},
        {imdb_id: "tt11540726", letterboxd_id: "resurrection-2022"}
      ],
      Host.find(2) => [
        {imdb_id: "tt8110652", letterboxd_id: "bodies-bodies-bodies"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0039410", letterboxd_id: "the-gangster"}
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
