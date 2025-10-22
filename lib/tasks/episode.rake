namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 462
    movie = Movie.find_or_create_by(imdb_id: "tt26658104", letterboxd_id: "imaginary-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt3281548", letterboxd_id: "little-women-2019"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0808357", letterboxd_id: "lust-caution"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0088258", letterboxd_id: "this-is-spinal-tap"}
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
