class DBoundsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    @stat.d_bounds.create
    record
  end
  
  protected
      
    def record
      create_log_event :defensive_rebound
    end

end
