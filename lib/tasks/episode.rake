namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 438
    movie = Movie.find_or_create_by(imdb_id: "tt26753003", letterboxd_id: "trap-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0060959", letterboxd_id: "daisies"},
        {imdb_id: "tt33813460", letterboxd_id: "all-gods-children-2024"}
      ],
      Host.find(2) => [
        {imdb_id: "tt22173666", letterboxd_id: "azrael-2024"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0071381", letterboxd_id: "celine-and-julie-go-boating"},
        {imdb_id: "tt0089489", letterboxd_id: "lifeforce"}
      ],
      Host.find(79) => [
        {imdb_id: "tt32359447", letterboxd_id: "hot-frosty"}
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
