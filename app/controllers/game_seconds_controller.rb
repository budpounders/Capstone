class GameSecondsController < ApplicationController
  def create
		@game = Game.find(params['game_id'])
		@game.game_seconds.create
		minutes=(@game.game_seconds.length / 60).to_s
		seconds=(@game.game_seconds.length % 60).to_s
		@t = minutes + ":"+ seconds
		end

end
