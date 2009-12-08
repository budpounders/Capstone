class InactiveAwayPlayer < ActiveRecord::Base
	belongs_to :game
	belongs_to :stat
	
end
