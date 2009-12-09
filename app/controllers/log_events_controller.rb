class LogEventsController < ApplicationController
  # DELETE /models/1
  # DELETE /models/1.xml
  def destroy
    @lg = LogEvent.find(params[:id]).destroy
    @game = @lg.game
    
    case @lg.action
    when 'free_throw' then @game.update_score_for_team @lg.team, -1
    when 'two_point' then @game.update_score_for_team @lg.team, -2
    when 'three_point' then @game.update_score_for_team @lg.team, -3
    end
    
    respond_to do |wants|
      wants.html { redirect_to game }
      wants.js
    end
  end
  
  protected
    def update_score(g)

        
    end

end
