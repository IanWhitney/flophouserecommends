namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 366
    movie = Movie.find_or_create_by(imdb_id: "tt2180339", letterboxd_id: "deep-water-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt2292382", letterboxd_id: "video-diary-of-a-lost-girl"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0156887", letterboxd_id: "perfect-blue"}
      ],
      Host.find(3) => [
        {imdb_id: "tt11741044", letterboxd_id: "i-was-a-simple-man"}
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
