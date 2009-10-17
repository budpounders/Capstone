class CreateDBounds < ActiveRecord::Migration
  def self.up
    create_table :d_bounds do |t|
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :d_bounds
  end
end
