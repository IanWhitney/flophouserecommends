namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 393
    movie = Movie.find_or_create_by(imdb_id: "tt14109724", letterboxd_id: "ticket-to-paradise-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt10366206", letterboxd_id: "john-wick-chapter-4"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0465538", letterboxd_id: "michael-clayton"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0101561", letterboxd_id: "chameleon-street"}
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
