namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 382
    movie = Movie.find_or_create_by(imdb_id: "tt9735462", letterboxd_id: "aline-2020-1")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0095812", letterboxd_id: "paganini-horror"}
      ],
      Host.find(2) => [
        {imdb_id: "tt12477480", letterboxd_id: "decision-to-leave"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0165078", letterboxd_id: "after-life"}
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
