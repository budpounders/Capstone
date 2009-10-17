class AddTableLocToActiveAwayPlayers < ActiveRecord::Migration
  def self.up
    add_column :active_away_players, :table_loc, :integer, :default =>0
  end

  def self.down
    remove_column :active_away_players, :table_loc
  end
end
