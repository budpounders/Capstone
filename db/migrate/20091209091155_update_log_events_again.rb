class UpdateLogEventsAgain < ActiveRecord::Migration
  def self.up
    remove_column :log_events, :sub_stat_id
    add_column :log_events, :action, :string
  end

  def self.down
    remove_column :log_events, :action
    add_column :log_events, :sub_stat_id, :integer
  end
end
