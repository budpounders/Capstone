class TurnOversController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.turn_overs.create
    record(s)
    
    respond_to do |format|
      format.js
    end
  end
  
  protected
      
    def record(s)
      create_log_event :turn_over, s
    end
end
