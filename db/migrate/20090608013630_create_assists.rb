class CreateAssists < ActiveRecord::Migration
  def self.up
    create_table :assists do |t|
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assists
  end
end
