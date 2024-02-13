namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 415
    movie = Movie.find_or_create_by(imdb_id: "tt0299930", letterboxd_id: "gigli")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
      ],
      Host.find(2) => [
      ],
      Host.find(3) => [
      ]
    }

    x.each do |host, recs|
      episode.find_or_create_host(host)
      recs.each do |rec|
        movie = Movie.find_or_create_by(rec)
        Recommendation.find_or_create_by(episode: episode, host: host, movie: movie)
      end
    end

    episode_id = 416
    movie = Movie.find_or_create_by(imdb_id: "tt0090859", letterboxd_id: "cobra-1986")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
      ],
      Host.find(2) => [
      ],
      Host.find(3) => [
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
