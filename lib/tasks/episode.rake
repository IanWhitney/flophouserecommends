namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 411
    movie = Movie.find_or_create_by(imdb_id: "tt0117550", letterboxd_id: "santa-with-muscles")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt8589698", letterboxd_id: "teenage-mutant-ninja-turtles-mutant-mayhem"}
      ],
      Host.find(2) => [
        {imdb_id: "tt16300962", letterboxd_id: "when-evil-lurks"},
        {imdb_id: "tt14849194", letterboxd_id: "the-holdovers"}
      ],
      Host.find(3) => [
        {imdb_id: "tt23289160", letterboxd_id: "godzilla-minus-one"}
      ],
      Host.find(53) => [
        {imdb_id: "tt13051724", letterboxd_id: "limmensita"}
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
