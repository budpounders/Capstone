class AddGameIdToGameSeconds < ActiveRecord::Migration
  def self.up
		add_column :game_seconds, :game_id, :integer
  end

  def self.down
		remove_column :game_seconds, :game_id
  end
end
