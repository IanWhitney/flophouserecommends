namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 365
    movie = Movie.find_or_create_by(imdb_id: "tt4513678", letterboxd_id: "ghostbusters-afterlife")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt8097030", letterboxd_id: "turning-red"},
        {imdb_id: "tt0101615", letterboxd_id: "cool-as-ice"}
      ],
      Host.find(2) => [
        {imdb_id: "tt11317142", letterboxd_id: "shiva-baby-2020"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0022651", letterboxd_id: "back-street-1932"}
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
