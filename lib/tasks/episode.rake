namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 419
    movie = Movie.find_or_create_by(imdb_id: "tt14647404", letterboxd_id: "cat-person")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt15477042", letterboxd_id: "waitress-the-musical"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0055256", letterboxd_id: "one-two-three"},
        {imdb_id: "tt0043972", letterboxd_id: "the-river"}
      ],
      Host.find(4) => [
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
