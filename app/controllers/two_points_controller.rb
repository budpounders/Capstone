class TwoPointsController < ApplicationController
  def create
    @stat = Stat.find(params[:stat_id])
    @game = Game.find(params[:game_id])
    
    @stat.two_points.create
    
    if ( Player.find(@stat.player_id).team_id == @game.team1_id )
      @game.home_score += 2
    else
      @game.away_score += 2
    end
    
    @game.save
    
    player = Player.find(@stat.player_id)
    @new_log_event = @game.log_events.create
    @new_log_event.message = player.number.to_s + ' ' + player.name + ' scores 2'
    @new_log_event.save
    
  end

end
