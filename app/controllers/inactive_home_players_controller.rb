class InactiveHomePlayersController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.inactive_home_players.create
  end
  
  def destroy
  	@game = Game.find(params[:game_id])
    @inactive_player = @game.inactive_home_players.find(params[:id])
    
    @new_active_home_player = @game.active_home_players.create
    @new_active_home_player.stat_id = @inactive_player.stat_id
    @new_active_home_player.save
 	 
  	@inactive_player.destroy
  	
  	respond_to do |format|
  	 format.html {redirect_to @game}
  	 format.js
  	end
  end

end
