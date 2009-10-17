class InactiveAwayPlayersController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.inactive_away_players.create
  end
  
  def destroy
   @game = Game.find(params[:game_id])
 	 @inactive_player = @game.inactive_away_players.find(params[:id])
 	 
 	 @new_active_away_player = @game.active_away_players.create
	 @new_active_away_player.stat_id = @inactive_player.stat_id
	 @new_active_away_player.save
 	 
 	 @inactive_player.destroy
 	 
 	 respond_to do |format|
 	   format.html {redirect_to @game}
 	   format.js
 	 end
 end
end
