namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 409
    movie = Movie.find_or_create_by(imdb_id: "tt13923456", letterboxd_id: "mafia-mamma")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt22687790", letterboxd_id: "a-haunting-in-venice"},
        {imdb_id: "tt13923456", letterboxd_id: "mafia-mamma"}
      ],
      Host.find(2) => [
        {imdb_id: "tt21397580", letterboxd_id: "suitable-flesh"}
      ],
      Host.find(3) => [
        {imdb_id: "tt23061176", letterboxd_id: "property-2022"}
      ],
      Host.find(4) => [
        {imdb_id: "tt0203230", letterboxd_id: "you-can-count-on-me"}
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
