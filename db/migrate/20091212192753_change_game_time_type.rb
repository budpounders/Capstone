class ChangeGameTimeType < ActiveRecord::Migration
  def self.up
    change_column :games, :time, :string, :default=>'20:00'
  end

  def self.down
    change_column :games, :time, :string
  end
end
