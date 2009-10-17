class AddMessageAndStatIdToLogEvent < ActiveRecord::Migration
  def self.up
    add_column :log_events, :message, :string
    add_column :log_events, :sub_stat_id, :string
  end

  def self.down
    remove_column :log_events, :message
    remove_column :log_events, :sub_stat_id
  end
end
