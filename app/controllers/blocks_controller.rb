class BlocksController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    @stat.blocks.create
    record
  end
  
  protected
      
    def record
      create_log_event :block
    end

end
