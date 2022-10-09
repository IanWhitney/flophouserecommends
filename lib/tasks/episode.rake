namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 380
    movie = Movie.find_or_create_by(imdb_id: "tt11851548", letterboxd_id: "orphan-first-kill")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0369348", letterboxd_id: "creating-rem-lezar"}
      ],
      Host.find(2) => [
        {imdb_id: "tt12724306", letterboxd_id: "glorious-2022"},
        {imdb_id: "tt8093700", letterboxd_id: "the-woman-king"}
      ],
      Host.find(3) => [
        {imdb_id: "tt8893974", letterboxd_id: "passing-2021"}
      ],
      Host.find(4) => [
        {imdb_id: "tt12441478", letterboxd_id: "earwig-and-the-witch"}
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
