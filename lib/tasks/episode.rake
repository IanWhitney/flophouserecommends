namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 370
    movie = Movie.find_or_create_by(imdb_id: "tt5834426", letterboxd_id: "moonfall")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt2457504", letterboxd_id: "delta-space-mission"}
      ],
      Host.find(2) => [
        {imdb_id: "tt14039582", letterboxd_id: "drive-my-car"}
      ],
      Host.find(3) => [
        {imdb_id: "tt2375574", letterboxd_id: "a-field-in-england"}
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
