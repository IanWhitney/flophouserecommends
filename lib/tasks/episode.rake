namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 444
    movie = Movie.find_or_create_by(imdb_id: "tt18272208", letterboxd_id: "here-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0093586", letterboxd_id: "mutant-hunt"},
        {imdb_id: "tt0273925", letterboxd_id: "black-tight-killers"}
      ],
      Host.find(2) => [
        {imdb_id: "tt14561712", letterboxd_id: "la-chimera"}
      ],
      Host.find(3) => [
        {imdb_id: "tt27403986", letterboxd_id: "juror-2"}
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
