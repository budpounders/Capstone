class AssistsController < ApplicationController
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])
    @stat.assists.create
        
    respond_to do |format|
 	   format.html {redirect_to @game}
 	   format.js
 	 end
  end
end
