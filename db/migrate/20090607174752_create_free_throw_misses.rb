class CreateFreeThrowMisses < ActiveRecord::Migration
  def self.up
    create_table :free_throw_misses do |t|
      t.integer :stat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :free_throw_misses
  end
end
