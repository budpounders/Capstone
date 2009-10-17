class CreateThreePoints < ActiveRecord::Migration
  def self.up
    create_table :three_points do |t|
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :three_points
  end
end
