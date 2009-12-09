class AddStatIdToLogEvent < ActiveRecord::Migration
  def self.up
    add_column :log_events, :stat_id, :integer
  end

  def self.down
    remove_column :log_events, :stat_id
  end
end
