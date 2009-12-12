# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091212192753) do

  create_table "active_away_players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "table_loc",  :default => 0
  end

  create_table "active_home_players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "table_loc",  :default => 0
  end

  create_table "assists", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_bounds", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "free_throw_misses", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "free_throws", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_seconds", :force => true do |t|
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team1_id",      :default => 0
    t.integer  "team2_id",      :default => 0
    t.integer  "table_counter", :default => 0
    t.integer  "home_score",    :default => 0
    t.integer  "away_score",    :default => 0
    t.boolean  "clock_active",  :default => false
    t.string   "time",          :default => "0"
  end

  create_table "inactive_away_players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "table_loc",  :default => 0
  end

  create_table "inactive_home_players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "table_loc",  :default => 0
  end

  create_table "log_events", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "message"
    t.integer  "game_id"
    t.integer  "stat_id"
    t.string   "action"
    t.integer  "team_id"
  end

  create_table "o_bounds", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_fouls", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id",    :default => 1
  end

  create_table "stats", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id",  :default => 0
    t.integer  "game_id"
  end

  create_table "steals", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "three_point_misses", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "three_points", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turn_overs", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "two_point_misses", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "two_points", :force => true do |t|
    t.integer  "stat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
