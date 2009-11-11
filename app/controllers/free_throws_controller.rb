class FreeThrowsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    @stat.free_throws.create
    @game.update_score @stat.player.team_id, 1
    record
  end
  
  protected
      
    def record
      create_log_event :free_throw
    end
  
end
