class CreateOBounds < ActiveRecord::Migration
  def self.up
    create_table :o_bounds do |t|
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :o_bounds
  end
end
