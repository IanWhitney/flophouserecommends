namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 412
    movie = Movie.find_or_create_by(imdb_id: "tt12747748", letterboxd_id: "leave-the-world-behind-2023")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt13651794", letterboxd_id: "may-december"}
      ],
      Host.find(2) => [
        {imdb_id: "tt15771916", letterboxd_id: "you-hurt-my-feelings-2023"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0027387", letterboxd_id: "born-to-dance"}
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
