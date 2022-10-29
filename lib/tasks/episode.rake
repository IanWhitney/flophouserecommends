namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 381
    movie = Movie.find_or_create_by(imdb_id: "tt10039344", letterboxd_id: "countdown-2019")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt14444726", letterboxd_id: "tar-2022"}
      ],
      Host.find(2) => [
        {imdb_id: "tt4028464", letterboxd_id: "the-innocents-2021"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0084740", letterboxd_id: "el-sur"}
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
