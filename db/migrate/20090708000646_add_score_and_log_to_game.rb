class AddScoreAndLogToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :home_score, :integer, :default=>0
    add_column :games, :away_score, :integer, :default=>0
  end

  def self.down
    remove_column :games, :home_score
    remove_column :games, :away_score
  end
end
