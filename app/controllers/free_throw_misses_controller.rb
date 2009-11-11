class FreeThrowMissesController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    @stat.free_throw_misses.create
    record
  end
  
  protected
      
    def record
      create_log_event :free_throw_miss
    end
end
