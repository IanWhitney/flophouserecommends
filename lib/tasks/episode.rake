namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 413
    movie = Movie.find_or_create_by(imdb_id: "tt14998742", letterboxd_id: "rebel-moon-part-one-a-child-of-fire")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt24249946", letterboxd_id: "the-caine-mutiny-court-martial-2023"}
      ],
      Host.find(2) => [
        {imdb_id: "tt17009710", letterboxd_id: "anatomy-of-a-fall"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0193647", letterboxd_id: "you-are-not-i"}
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
