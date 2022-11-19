namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 383
    movie = Movie.find_or_create_by(imdb_id: "tt14813212", letterboxd_id: "the-munsters")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt2258337", letterboxd_id: "eega"}
      ],
      Host.find(2) => [
        {imdb_id: "tt4995790", letterboxd_id: "the-square-2017"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0044105", letterboxd_id: "the-tall-target"}
      ],
      Host.find_or_create_by(name: "Kevin Maher") => [
        {imdb_id: "tt0082498", letterboxd_id: "happy-birthday-to-me"}
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
