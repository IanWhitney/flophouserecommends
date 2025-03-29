namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 448
    movie = Movie.find_or_create_by(imdb_id: "tt0082507", letterboxd_id: "heartbeeps")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt30988739", letterboxd_id: "black-bag-2025"}
      ],
      Host.find(2) => [
        {imdb_id: "tt33478963", letterboxd_id: "rap-world"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0064179", letterboxd_id: "the-comic"}
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
