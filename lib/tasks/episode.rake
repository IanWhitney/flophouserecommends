namespace :episode do
  desc "Add Episode"
  task add: :environment do
    episode_id = 443
    movie = Movie.find_or_create_by(imdb_id: "tt1609486", letterboxd_id: "harold-and-the-purple-crayon-2024")
    episode = Episode.find_or_create_by(id: episode_id, movie: movie)

    x = {
      Host.find(1) => [
        {imdb_id: "tt0065492", letterboxd_id: "brewster-mccloud"},
        {imdb_id: "tt0083745", letterboxd_id: "come-back-to-the-5-dime-jimmy-dean-jimmy-dean"}
      ],
      Host.find(2) => [
        {imdb_id: "tt4772188", letterboxd_id: "flow-2024"}
      ],
      Host.find(3) => [
        {imdb_id: "tt0072281", letterboxd_id: "the-three-musketeers-1973"}
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
