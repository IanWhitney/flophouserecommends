namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 354
    movie = Movie.find_or_create_by(imdb_id: "tt9419056", letterboxd_id: "the-unholy-2021")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0093119", letterboxd_id: "grizzly-ii-revenge"}
      ],
      Host.find(2) => [
        {imdb_id: "tt11003218", letterboxd_id: "pig-2021"}
      ],
      Host.find(3) => [
        {imdb_id: "tt3811906", letterboxd_id: "malignant-2021"}
      ],
      Host.find(50) => [
        {imdb_id: "tt0082242", letterboxd_id: "dead-buried"}
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
