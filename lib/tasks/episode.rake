namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 362
    movie = Movie.find_or_create_by(imdb_id: "tt0190374", letterboxd_id: "dungeons-dragons")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt1791528", letterboxd_id: "inherent-vice"}
      ],
      Host.find(2) => [
        {imdb_id: "tt4244994", letterboxd_id: "the-last-duel-2021"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0074916", letterboxd_id: "mr-klein"}
      ],
      Host.find_or_create_by(name: "Adam Rex") => [
        {imdb_id: "tt9243804", letterboxd_id: "the-green-knight"}
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
