namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 375
    movie = Movie.find_or_create_by(imdb_id: "tt0096101", letterboxd_id: "short-circuit-2")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0105796", letterboxd_id: "the-cat-1992"}
      ],
      Host.find(2) => [
        {imdb_id: "tt2193215", letterboxd_id: "the-counselor"}
      ],
      Host.find(3) => [
        {imdb_id: "tt8178634", letterboxd_id: "rrr"}
      ],
      Host.find_or_create_by(name: "Ben Hosley") => [
        {imdb_id: "tt2094766", letterboxd_id: "assassins-creed"}
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
