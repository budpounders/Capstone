class PlayersController < ApplicationController
  def create
			#need to implement
	end

	def show
    @player = Player.find(params[:id])
    @stat = @player.stats[1]
  end
end
