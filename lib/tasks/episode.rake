namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 398
    movie = Movie.find_or_create_by(imdb_id: "tt10954600", letterboxd_id: "ant-man-and-the-wasp-quantumania")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0329691", letterboxd_id: "torque"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0108551", letterboxd_id: "whats-love-got-to-do-with-it"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0100143", letterboxd_id: "miami-blues"}
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
