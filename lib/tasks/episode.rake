namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 384
    movie = Movie.find_or_create_by(imdb_id: "tt8746404", letterboxd_id: "marmaduke-2022")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt14208870", letterboxd_id: "the-fabelmans"}
      ],
      Host.find(2) => [
        {imdb_id: "tt10168670", letterboxd_id: "bones-and-all"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0041968", letterboxd_id: "too-late-for-tears"}
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
