namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 451
    movie = Movie.find_or_create_by(imdb_id: "tt14260836", letterboxd_id: "better-man-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0087805", letterboxd_id: "ninja-iii-the-domination"}
      ],
      Host.find(2) => [
        {imdb_id: "tt31193180", letterboxd_id: "sinners-2025"}
      ],
      Host.find(3) => [
        {imdb_id: "tt9873892", letterboxd_id: "they-cloned-tyrone"}
      ],
      Host.find(4) => [
        {imdb_id: "tt0118892", letterboxd_id: "dangerous-beauty"}
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
