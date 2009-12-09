class BlocksController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.blocks.create
    record(s)
  end
  
  protected
      
    def record(s)
      create_log_event :block, s
    end

end
