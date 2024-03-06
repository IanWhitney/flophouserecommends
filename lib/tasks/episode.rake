namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 417
    movie = Movie.find_or_create_by(imdb_id: "tt12921446", letterboxd_id: "the-exorcist-believer")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0076740", letterboxd_id: "sorcerer"}
      ],
      Host.find(2) => [
        {imdb_id: "tt7130916", letterboxd_id: "dicks-the-musical"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0044486", letterboxd_id: "carrie"}
      ]
    }

    x.each do |host, recs|
      episode.find_or_create_host(host)
      recs.each do |rec|
        movie = Movie.find_or_create_by(rec)
        Recommendation.find_or_create_by(episode: episode, host: host, movie: movie)
      end
    end

    episode_id = 418
    movie = Movie.find_or_create_by(imdb_id: "tt0101615", letterboxd_id: "cool-as-ice")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
      ],
      Host.find(2) => [
      ],
      Host.find(3) => [
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
