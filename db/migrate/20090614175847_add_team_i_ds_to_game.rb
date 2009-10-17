class AddTeamIDsToGame < ActiveRecord::Migration
  def self.up
  		add_column :games, :team1_id, :integer, :default =>0
      add_column :games, :team2_id, :integer, :default =>0
  end

  def self.down
    	remove_column :games, :team1_id
      remove_column :games, :team2_id
  end
end
