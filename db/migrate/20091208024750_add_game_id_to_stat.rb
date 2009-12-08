class AddGameIdToStat < ActiveRecord::Migration
  def self.up
    add_column :stats, :game_id, :integer
  end

  def self.down
    remove_column :stats, :game_id
  end
end
