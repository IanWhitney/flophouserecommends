# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_30_212725) do

  create_table "episodes", force: :cascade do |t|
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "episodes_hosts", id: false, force: :cascade do |t|
    t.integer "episode_id"
    t.integer "host_id"
    t.index ["episode_id"], name: "index_episodes_hosts_on_episode_id"
    t.index ["host_id"], name: "index_episodes_hosts_on_host_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "imdb_id"
    t.string "letterboxd_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imdb_id"], name: "index_movies_on_imdb_id", unique: true
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "episode_id"
    t.integer "host_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["episode_id"], name: "index_recommendations_on_episode_id"
    t.index ["host_id"], name: "index_recommendations_on_host_id"
    t.index ["movie_id"], name: "index_recommendations_on_movie_id"
  end

  add_foreign_key "episodes", "movies"
  add_foreign_key "episodes_hosts", "episodes"
  add_foreign_key "episodes_hosts", "hosts"
  add_foreign_key "recommendations", "episodes"
  add_foreign_key "recommendations", "hosts"
  add_foreign_key "recommendations", "movies"
end
