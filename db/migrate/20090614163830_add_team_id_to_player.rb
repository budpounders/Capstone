class AddTeamIdToPlayer < ActiveRecord::Migration
  def self.up
      add_column :players, :team_id, :integer, :default=>1
  end

  def self.down
  		remove_column :players, :team_id
  end
end
