namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 445
    movie = Movie.find_or_create_by(imdb_id: "tt9603060", letterboxd_id: "star-trek-section-31")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0029929", letterboxd_id: "bluebeards-eighth-wife"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0098519", letterboxd_id: "troop-beverly-hills"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0079278", letterboxd_id: "chilly-scenes-of-winter"}
      ],
      Host.find(64) => [
        {imdb_id: "tt0309530", letterboxd_id: "down-with-love"}
      ],
      Host.find_or_create_by(name: "Adam Pranica") => [
        {imdb_id: "tt10640346", letterboxd_id: "babylon-2022"}
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
