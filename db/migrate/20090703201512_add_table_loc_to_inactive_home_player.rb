class AddTableLocToInactiveHomePlayer < ActiveRecord::Migration
  def self.up
    add_column :inactive_home_players, :table_loc, :integer, :default =>0
  end

  def self.down
    remove_column :inactive_home_players, :table_loc
  end
end
