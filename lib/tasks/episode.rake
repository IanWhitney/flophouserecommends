namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 379
    movie = Movie.find_or_create_by(imdb_id: "tt8480678", letterboxd_id: "pinocchio-a-true-story")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt15791034", letterboxd_id: "barbarian-2022"}
      ],
      Host.find(2) => [
        {imdb_id: "tt10756184", letterboxd_id: "saloum"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0030341", letterboxd_id: "the-lady-vanishes "}
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
