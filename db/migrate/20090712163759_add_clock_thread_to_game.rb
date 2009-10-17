class AddClockThreadToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :clock, :thread
  end

  def self.down
    remove_column :games, :clock
  end
end
