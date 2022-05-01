namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 368
    movie = Movie.find_or_create_by(imdb_id: "tt4532038", letterboxd_id: "the-war-with-grandpa")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt11348542", letterboxd_id: nil}
      ],
      Host.find(2) => [
        {imdb_id: "tt10986222", letterboxd_id: "cmon-cmon"}
      ],
      Host.find(3) => [
        {imdb_id: "tt10696784", letterboxd_id: "the-harder-they-fall-2021"}
      ],
      Host.find_or_create_by(name: "Griffin McElroy") => [
        {imdb_id: "tt6710474", letterboxd_id: "everything-everywhere-all-at-once"}
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
