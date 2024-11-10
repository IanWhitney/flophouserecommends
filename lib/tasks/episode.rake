namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 437
    movie = Movie.find_or_create_by(imdb_id: "tt10128846", letterboxd_id: "megalopolis-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0116922", letterboxd_id: "lost-highway"}
      ],
      Host.find(2) => [
        {imdb_id: "tt28607951", letterboxd_id: "anora"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0030996", letterboxd_id: "you-and-me"}
      ],
      Host.find(48) => [
        {imdb_id: "tt0102015", letterboxd_id: "hearts-of-darkness-a-filmmakers-apocalypse"}
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
