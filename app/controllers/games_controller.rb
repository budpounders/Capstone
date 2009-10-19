class GamesController < ApplicationController
  def create
    @game = Team.new(params[:game])
    
    if @game.save
      flash[:notice] = "Successfully created new team."
      redirect_to "/games/show/#{@game.id}"
    else
      render :action => 'new'
    end
  end
  
  def show
		@game = Game.find(params[:id])
    
=begin   
    @game.game_seconds.delete_all
    @game.active_home_players.clear
    @game.inactive_home_players.clear
    @game.active_away_players.clear
    @game.inactive_away_players.clear
    i=0
=end
		Team.find(@game.team1_id).players.each do | player |
		  if i < 5 
		  	a_new_stat = player.stats.create
				g = @game.active_home_players.create
				g.stat_id = a_new_stat.id
				g.save
		  else
		  	a_new_stat = player.stats.create
				g = @game.inactive_home_players.create
				g.stat_id = a_new_stat.id
				g.save				
			end
			i+=1
	  end
	  
	  i=0
	  
	  Team.find(@game.team2_id).players.each do | player |
		  if i < 5 
		  	a_new_stat = player.stats.create
				g = @game.active_away_players.create
				g.stat_id = a_new_stat.id
				g.save
		  else
		  	a_new_stat = player.stats.create
				g = @game.inactive_away_players.create
				g.stat_id = a_new_stat.id
				g.save				
			end
			i+=1
	  end
  end

  def new
    @game=Game.new
  end
end
