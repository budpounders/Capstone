class DBoundsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.d_bounds.create
    record(s)
  end
  
  protected
      
    def record(s)
      create_log_event :defensive_rebound, s
    end

end
