class ClockController < ApplicationController
	
	def start
		#@game = Game.find(params[:start])
		#@game.clock_active=!(@game.clock_active)
		#@game.save
  end

  def stop
		@game =Game.find(params[:game_id])
		@game.clock_active=false
		@game.save
  end

  def reset
  end

end
