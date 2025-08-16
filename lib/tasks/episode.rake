namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 458
    movie = Movie.find_or_create_by(imdb_id: "tt6208148", letterboxd_id: "snow-white-2025")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt3402138", letterboxd_id: "the-naked-gun"}
      ],
      Host.find(2) => [
        {imdb_id: "tt31184028", letterboxd_id: "together-2025"}
      ],
      Host.find(3) => [
        {imdb_id: "tt1698441", letterboxd_id: "the-trip-2010"}
      ],
      Host.find_or_create_by(name: "Rebecca Alter") => [
        {imdb_id: "tt0120728", letterboxd_id: "the-last-days-of-disco"}
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
