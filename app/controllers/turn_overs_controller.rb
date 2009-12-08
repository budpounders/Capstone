class TurnOversController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    @stat.turn_overs.create
    record
    
    respond_to do |format|
      format.js
    end
  end
  
  protected
      
    def record
      create_log_event :turn_over
    end
end
