class OBoundsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.o_bounds.create
    record(s)
  end
  
  protected
      
    def record(s)
      create_log_event :offensive_rebound, s
    end

end
