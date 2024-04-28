namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 423
    movie = Movie.find_or_create_by(imdb_id: "tt15009428", letterboxd_id: "argylle")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt10482654", letterboxd_id: "im-george-lucas-a-connor-ratliff-story"},
        {imdb_id: "tt14071694", letterboxd_id: "turn-every-page-the-adventures-of-robert-caro-and-robert-gottlieb"}
      ],
      Host.find(2) => [
        {imdb_id: "tt7160372", letterboxd_id: "the-zone-of-interest"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0108074", letterboxd_id: "the-eagle-shooting-heroes"}
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
