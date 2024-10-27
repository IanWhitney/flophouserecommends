namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 436
    movie = Movie.find_or_create_by(imdb_id: "tt9288740", letterboxd_id: "dear-david")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0109809", letterboxd_id: "flesheater"}
      ],
      Host.find(2) => [
        {imdb_id: "tt28491891", letterboxd_id: "his-three-daughters"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0067464", letterboxd_id: "the-girl-on-the-broomstick"}
      ],
      Host.find(4) => [
        {imdb_id: "tt0070644", letterboxd_id: "scenes-from-a-marriage-1973-1"}
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
