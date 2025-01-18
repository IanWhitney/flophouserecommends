namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 442
    movie = Movie.find_or_create_by(imdb_id: "tt11315808", letterboxd_id: "joker-folie-a-deux")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0025880", letterboxd_id: "thirty-day-princess"}
      ],
      Host.find(2) => [
        {imdb_id: "tt30057084", letterboxd_id: "babygirl-2024"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0053134", letterboxd_id: "good-morning"}
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
