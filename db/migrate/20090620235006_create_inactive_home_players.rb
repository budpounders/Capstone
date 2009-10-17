class CreateInactiveHomePlayers < ActiveRecord::Migration
  def self.up
    create_table :inactive_home_players do |t|
      t.integer :game_id
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inactive_home_players
  end
end
