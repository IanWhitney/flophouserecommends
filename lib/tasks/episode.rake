namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 410
    movie = Movie.find_or_create_by(imdb_id: "tt0439572", letterboxd_id: "the-flash")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt21942866", letterboxd_id: "dream-scenario"}
      ],
      Host.find(2) => [
        {imdb_id: "tt17351924", letterboxd_id: "saltburn"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0053114", letterboxd_id: "the-human-condition-i-no-greater-love"},
        {imdb_id: "tt0053115", letterboxd_id: "the-human-condition-ii-road-to-eternity"},
        {imdb_id: "tt0055233", letterboxd_id: "the-human-condition-iii-a-soldiers-prayer"}
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
