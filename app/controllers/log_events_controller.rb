class LogEventsController < ApplicationController
  # DELETE /models/1
  # DELETE /models/1.xml
  def destroy
    @lg = LogEvent.find(params[:id]).destroy
    game = @lg.game

    respond_to do |wants|
      wants.html { redirect_to game }
      wants.js
    end
  end

end
