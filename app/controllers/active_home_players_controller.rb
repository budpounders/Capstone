class ActiveHomePlayersController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.active_home_players.create
  end
  
  def destroy
  	 @game = Game.find(params[:game_id])
  	 @active_player = @game.active_home_players.find(params[:id])
  	 @new_inactive_home_player = @game.inactive_home_players.create
  	 @new_inactive_home_player.stat_id = @active_player.stat_id
  	 @new_inactive_home_player.save
  	 
  	 @active_player.destroy
  	 
	   respond_to do |format|
  	   format.html {redirect_to @game}
  	   format.js
  	 end
  end
end
