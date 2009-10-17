class CreateTwoPointMisses < ActiveRecord::Migration
  def self.up
    create_table :two_point_misses do |t|
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :two_point_misses
  end
end
