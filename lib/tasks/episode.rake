namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 371
    movie = Movie.find_or_create_by(imdb_id: "tt2328678", letterboxd_id: "the-kings-daughter-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0083670", letterboxd_id: "boardinghouse"}
      ],
      Host.find(2) => [
        {imdb_id: "tt7468056", letterboxd_id: "the-outlaws-2017"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0022208", letterboxd_id: "night-nurse"}
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
