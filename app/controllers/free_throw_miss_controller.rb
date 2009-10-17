class FreeThrowMissesController < ApplicationController
  def create
    @stat = Stat.find(params[:stat_id])
    @stat.free_throw_misses.create
  end

end
