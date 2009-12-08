class CreateTurnOvers < ActiveRecord::Migration
  def self.up
    create_table :turn_overs do |t|
      t.integer :stat_id
      t.timestamps
    end
  end

  def self.down
    drop_table :turn_overs
  end
end
