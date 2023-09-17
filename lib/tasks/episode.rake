namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 404
    movie = Movie.find_or_create_by(imdb_id: "tt1623780", letterboxd_id: "the-legend-of-the-titanic")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "", letterboxd_id: "doctor-death-1989"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0082085", letterboxd_id: "blow-out"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0066537", letterboxd_id: "the-murder-of-mr-devil"},
        {imdb_id: "tt0093258", letterboxd_id: "rouge"}
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
