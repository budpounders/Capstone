class LogEventsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.log_event.create
  end
end
