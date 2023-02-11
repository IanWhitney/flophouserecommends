namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 389
    movie = Movie.find_or_create_by(imdb_id: "tt14714980", letterboxd_id: "poker-face-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt21651430", letterboxd_id: "the-peoples-joker"},
        {imdb_id: "tt10365998", letterboxd_id: "infinity-pool"}
      ],
      Host.find(2) => [
        {imdb_id: "tt21651430", letterboxd_id: "the-peoples-joker"},
        {imdb_id: "tt1488589", letterboxd_id: "guillermo-del-toros-pinocchio"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0071269", letterboxd_id: "california-split"}
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
