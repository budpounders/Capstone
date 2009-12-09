class ThreePointsController < ApplicationController
  before_filter :grab_time, :only=>:create

  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])
    s = @stat.three_points.create

    @game.update_score @stat.player.team_id, 3
    record(s)
      
    respond_to do |format|
      format.html
      format.js
    end      
  end

  protected

    def record(s)
      create_log_event :three_point, s
    end
end
