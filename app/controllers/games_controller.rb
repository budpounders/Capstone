class GamesController < ApplicationController
  def create
    @game = Game.new(params[:game])
    
    if @game.save
      flash[:notice] = "Successfully created new team."
      
      i=0 

  		  Team.find(@game.team1_id).players.each do | player |
    		  a_new_stat = player.stats.create(:game_id => @game.id)
    		  if i < 5 
    				g = @game.active_home_players.create
    				g.stat_id = a_new_stat.id
    				g.save
    		  else
    				g = @game.inactive_home_players.create
    				g.stat_id = a_new_stat.id
    				g.save				
    			end
    			i+=1
    	  end

    	  i=0

    	  Team.find(@game.team2_id).players.each do | player |
    	  	a_new_stat = player.stats.create(:game_id => @game.id)
    		  if i < 5 
    				g = @game.active_away_players.create
    				g.stat_id = a_new_stat.id
    				g.save
    		  else
    				g = @game.inactive_away_players.create
    				g.stat_id = a_new_stat.id
    				g.save				
    			end
  			  i+=1
  	    end
      
      redirect_to @game
    else
      render :action => 'new'
    end
  end
  
  def show
		@game = Game.find(params[:id])
  end

  def new
    @game=Game.new
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      flash[:message] = 'Game Successfully Saved'
      redirect_to root_url
    else
      render :action=>'show'
    end
  end
end

