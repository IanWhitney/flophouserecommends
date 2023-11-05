namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 408
    movie = Movie.find_or_create_by(imdb_id: "tt0114898", letterboxd_id: "waterworld")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt21867434", letterboxd_id: "blackberry-2023"}
      ],
      Host.find(2) => [
        {imdb_id: "tt13238346", letterboxd_id: "past-lives"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0091188", letterboxd_id: "heartburn"}
      ],
      Host.find_or_create_by(name: "Todd Vaziri") => [
        {imdb_id: "tt24068064", letterboxd_id: "reality-2023"},
        {imdb_id: "tt0107362", letterboxd_id: "last-action-hero"}
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
