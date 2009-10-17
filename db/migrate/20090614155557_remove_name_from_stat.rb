class RemoveNameFromStat < ActiveRecord::Migration
  def self.up
    remove_column :stats, :name
  end

  def self.down
    add_column :stats, :name
  end
end
