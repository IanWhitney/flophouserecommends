require 'csv'

Episode.delete_all
Movie.delete_all

CSV.open('episodes.csv').each do |r|
  m = Movie.find_or_create_by(imdb_id: r[1], letterboxd_id: r[2]) if r[1].present?
  if m
    Episode.find_or_create_by(id: r[0], movie: m)
  else
    Episode.find_or_create_by(id: r[0])
  end
end
