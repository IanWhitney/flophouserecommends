namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 400
    movie = Movie.find_or_create_by(imdb_id: "tt0105643", letterboxd_id: "troll-2")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt1462764", letterboxd_id: "indiana-jones-and-the-dial-of-destiny"}
      ],
      Host.find(2) => [
        {imdb_id: "tt15671028", letterboxd_id: "no-hard-feelings-2023"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0067350", letterboxd_id: "little-murders"}
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
