class CreateGameSeconds < ActiveRecord::Migration
	  def self.up
	    create_table :game_seconds do |t|
	      t.timestamps
	    end
	  end

	  def self.down
	    drop_table :game_seconds
	  end
	end

