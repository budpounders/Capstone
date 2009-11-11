class TwoPointsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    @stat.two_points.create
    @game.update_score @stat.player.team_id, 2
    record
  end
  
  protected
      
    def record
      create_log_event :two_point
    end

end
