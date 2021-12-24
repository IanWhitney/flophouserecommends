namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 358
    movie = Movie.find_or_create_by(imdb_id: "tt8380776", letterboxd_id: "grand-isle-2019")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt5748448", letterboxd_id: "copshop"}
      ],
      Host.find(2) => [
        {imdb_id: "tt8676426", letterboxd_id: "the-fable"},
        {imdb_id: "tt13017204", letterboxd_id: "the-fable-the-killer-who-doesnt-kill"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0104797", letterboxd_id: "malcolm-x-1992"}
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
