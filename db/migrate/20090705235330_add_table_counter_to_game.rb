class AddTableCounterToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :table_counter, :integer, :default=>0
  end

  def self.down
    remove_column :games, :table_counter
  end
end
