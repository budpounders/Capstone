class AddClockActiveToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :clock_active, :boolean, :default=>false
  end

  def self.down
    remove_column :games, :clock_active
  end
end
