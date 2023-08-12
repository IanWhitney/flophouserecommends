namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 402
    movie = Movie.find_or_create_by(imdb_id: "tt0113957", letterboxd_id: "the-net")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [],
      Host.find(2) => [
        {imdb_id: "tt0080661", letterboxd_id: "dressed-to-kill-1980"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0025797", letterboxd_id: "sing-and-like-it"}
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
