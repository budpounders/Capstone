class CreateSteals < ActiveRecord::Migration
  def self.up
    create_table :steals do |t|
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :steals
  end
end
