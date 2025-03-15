namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 446
    movie = Movie.find_or_create_by(imdb_id: "tt8790086", letterboxd_id: "kraven-the-hunter")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt11674730", letterboxd_id: "the-last-stop-in-yuma-county"}
      ],
      Host.find(2) => [
        {imdb_id: "tt27714946", letterboxd_id: "the-monkey-2025"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0089371", letterboxd_id: "mr-vampire"}
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
