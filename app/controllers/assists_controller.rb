class AssistsController < ApplicationController
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])
    @stat.assists.create
    
    player = Player.find(@stat.player_id)
    @new_log_event = @game.log_events.create
    time= @game.elapsed_seconds
    @new_log_event.message = player.number.to_s + ' ' + player.name + " ::: assist ::: #{time}"
    @new_log_event.save
    
    respond_to do |format|
 	   format.html {redirect_to @game}
 	   format.js
 	 end
  end
end
