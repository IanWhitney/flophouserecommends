class DatabaseConstraints < ActiveRecord::Migration[6.1]
  def change
    add_index(:movies, :imdb_id, unique: true)
    add_foreign_key(:episodes, :movies)
    add_foreign_key(:recommendations, :episodes)
    add_index(:recommendations, :episode_id)
    add_foreign_key(:recommendations, :hosts)
    add_index(:recommendations, :host_id)
    add_foreign_key(:recommendations, :movies)
    add_index(:recommendations, :movie_id)
    add_foreign_key(:episodes_hosts, :episodes)
    add_foreign_key(:episodes_hosts, :hosts)
  end
end
