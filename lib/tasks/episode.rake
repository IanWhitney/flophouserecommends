namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 369
    movie = Movie.find_or_create_by(imdb_id: "tt7097896", letterboxd_id: "venom-let-there-be-carnage")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt13648224", letterboxd_id: "were-all-going-to-the-worlds-fair"}
      ],
      Host.find(2) => [
        {imdb_id: "tt11138512", letterboxd_id: "the-northman"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0021607", letterboxd_id: "an-american-tragedy"}
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
