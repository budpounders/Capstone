class FreeThrowsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.free_throws.create
    @game.update_score @stat.player.team_id, 1
    record(s)
  end
  
  protected
      
    def record(s)
      create_log_event :free_throw, s
    end
  
end
