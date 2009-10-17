class AddGameIdToLogEvent < ActiveRecord::Migration
  def self.up
    add_column :log_events, :game_id, :integer
  end

  def self.down
    remove_column :log_events, :game_id
  end
end
