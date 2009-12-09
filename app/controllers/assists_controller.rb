class AssistsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.assists.create
    debugger
    record(s)
  end
  
  def destroy
    
  end
  
  protected
      
    def record(s)
      create_log_eventa :assist, s
    end
end
