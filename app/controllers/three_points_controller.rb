class ThreePointsController < ApplicationController
  before_filter :grab_time, :only=>:create

  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])
    @stat.free_throws.create

    @game.update_score @stat.player.team_id, 3
    record
      
    respond_to do |format|
      format.html
      format.js
    end      
  end

  protected

    def record
      create_log_event :three_point    
    end
end
