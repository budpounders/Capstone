class DBoundsController < ApplicationController
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])
    @stat.d_bounds.create
    
    player = Player.find(@stat.player_id)
    @new_log_event = @game.log_events.create
    @new_log_event.message = player.number.to_s + ' ' + player.name + ' ::: defensive rebound'
    @new_log_event.save
    
    respond_to do |format|
 	   format.html {redirect_to @game}
 	   format.js
 	  end
  end

end
