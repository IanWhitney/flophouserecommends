namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 377
    movie = Movie.find_or_create_by(imdb_id: "tt1649418", letterboxd_id: "the-gray-man-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0275847", letterboxd_id: "lilo-stitch"}
      ],
      Host.find(2) => [
        {imdb_id: "tt10954984", letterboxd_id: "nope"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0029201", letterboxd_id: "the-man-who-could-work-miracles"}
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
