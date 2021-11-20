namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 356
    movie = Movie.find_or_create_by(letterboxd_id: "the-very-excellent-mr-dundee", imdb_id: "tt8560172")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt9639470", letterboxd_id: "last-night-in-soho"}
      ],
      Host.find(2) => [
        {imdb_id: "tt11655202", letterboxd_id: "riders-of-justice"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0092238", letterboxd_id: "working-girls-1986"}
      ],
      Host.find_or_create_by(name: "Ben Harrison") => [
        {imdb_id: "tt12618926", letterboxd_id: "parallel-mothers"}
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
