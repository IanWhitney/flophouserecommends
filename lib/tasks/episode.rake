namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 388
    movie = Movie.find_or_create_by(imdb_id: "tt10731256", letterboxd_id: "dont-worry-darling")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0107529", letterboxd_id: "matinee"}
      ],
      Host.find(2) => [
        {imdb_id: "tt9900782", letterboxd_id: "kaithi"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0047300", letterboxd_id: "the-garden-of-women"}
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
