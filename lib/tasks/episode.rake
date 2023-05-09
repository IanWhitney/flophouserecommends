namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 395
    movie = Movie.find_or_create_by(imdb_id: "tt13375076", letterboxd_id: "the-popes-exorcist")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt13375076", letterboxd_id: "the-popes-exorcist"},
        {imdb_id: "tt2906216", letterboxd_id: "dungeons-dragons-honor-among-thieves"}
      ],
      Host.find(2) => [
        {imdb_id: "tt8574252", letterboxd_id: "the-witch-part-1-the-subversion"},
        {imdb_id: "tt13721828", letterboxd_id: "the-witch-part-2-the-other-one"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0094670", letterboxd_id: "the-appointments-of-dennis-jennings"}
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
