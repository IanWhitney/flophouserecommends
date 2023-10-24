namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 407
    movie = Movie.find_or_create_by(imdb_id: "tt0097388", letterboxd_id: "friday-the-13th-part-viii-jason-takes-manhattan")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0103644", letterboxd_id: "alien-3"}
      ],
      Host.find(2) => [
        {imdb_id: "tt11703244", letterboxd_id: "the-blackening"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0129332", letterboxd_id: "ravenous"}
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
