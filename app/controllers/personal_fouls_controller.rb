class PersonalFoulsController < ApplicationController
  before_filter :grab_time, :only=>:create
  
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])

    s = @stat.personal_fouls.create
    record(s)
  end
  
  protected
      
    def record(s)
      create_log_event :personal_foul, s
    end

end
