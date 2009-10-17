class AddPlayerIdToStats < ActiveRecord::Migration
  def self.up
    add_column :stats, :player_id, :integer, :default=>0
  end

  def self.down
    remove_column :stats, :player_id
  end
end
