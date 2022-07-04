namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 373
    movie = Movie.find_or_create_by(imdb_id: "tt7657566", letterboxd_id: "death-on-the-nile-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt15090124", letterboxd_id: "mad-god"}
      ],
      Host.find(2) => [
        {imdb_id: "tt0430357", letterboxd_id: "miami-vice"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0068713", letterboxd_id: "horror-express"}
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
