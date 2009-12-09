class ThreePointMissesController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.three_point_misses.create
    record(s)
  end
  
  protected
      
    def record(s)
      create_log_event :three_point_miss, s
    end

end
