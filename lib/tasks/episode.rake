namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 414
    movie = Movie.find_or_create_by(imdb_id: "tt0257568", letterboxd_id: "kangaroo-jack")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0097228", letterboxd_id: "dr-caligari"}
      ],
      Host.find(2) => [
        {imdb_id: "tt21064584", letterboxd_id: "the-iron-claw-2023"}
      ],
      Host.find(3) => [
        {imdb_id: "tt5715874", letterboxd_id: "the-killing-of-a-sacred-deer"}
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
