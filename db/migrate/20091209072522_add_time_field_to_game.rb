class AddTimeFieldToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :time, :integer, :default => 0
  end

  def self.down
    remove_column :games, :time
  end
end
