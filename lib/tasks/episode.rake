namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 394
    movie = Movie.find_or_create_by(imdb_id: "tt12823454", letterboxd_id: "your-place-or-mine-2023")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0270523", letterboxd_id: "the-movie-orgy"}
      ],
      Host.find(2) => [
        {imdb_id: "tt3915174", letterboxd_id: "puss-in-boots-the-last-wish"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0075404", letterboxd_id: "the-ascent"}
      ],
      Host.find(4) => [
        {imdb_id: "tt11687104", letterboxd_id: "alice-darling"}
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
