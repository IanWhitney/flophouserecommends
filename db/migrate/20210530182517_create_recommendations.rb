class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.integer :episode_id
      t.integer :host_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
