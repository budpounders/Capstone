class ActiveAwayPlayersController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.active_away_players.create
  end
  
  def destroy
  	 @game = Game.find(params[:game_id])
  	 @active_player = @game.active_away_players.find(params[:id])
  	 
  	 @new_inactive_away_player = @game.inactive_away_players.create
  	 @new_inactive_away_player.stat_id = @active_player.stat_id
  	 @new_inactive_away_player.save
  	 
  	 @active_player.destroy
  	 
  	 respond_to do |format|
  	   format.html {redirect_to @game}
  	   format.js
  	 end
  end
end