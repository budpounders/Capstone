class FreeThrowMissesController < ApplicationController
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])
    @stat.free_throw_misses.create
    
    player = Player.find(@stat.player_id)
    @new_log_event = @game.log_events.create
    @new_log_event.message = player.number.to_s + ' ' + player.name + ' misses a free throw'
    @new_log_event.save
  end
end
