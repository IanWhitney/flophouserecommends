namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 427
    movie = Movie.find_or_create_by(imdb_id: "tt0109635", letterboxd_id: "disclosure")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0140821", letterboxd_id: "asparagus"}
      ],
      Host.find(2) => [
        {imdb_id: "tt14034966", letterboxd_id: "wheel-of-fortune-and-fantasy"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0119250", letterboxd_id: "fireworks-1997"}
      ],
      Host.find_or_create_by(name: "Meredith Scardino") => [
        {letterboxd_id: "satisfied-2024", title: "Satisfied"}
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
