class GamesController < ApplicationController
  def create
  		@game = Game.new
			@game.team1_id=1
			@game.team2_id=2
			@game.save
				
 			team1 = Team.find(@game.team1_id)
			team2 = Team.find(@game.team2_id)
			
			i=0

			team1.players.each do | player |
			  if i < 5 
			  	a_new_stat = player.stats.create
					g = @game.active_home_players.create
					g.stat_id = a_new_stat.id
					g.save
			  else
			  	a_new_stat = player.stats.create
					g = @game.active_home_players.create
					g.stat_id = a_new_stat.id
					g.save				
				end
				i+=1
		  end

		  i=0
		  
			team2.players.each do | player |
			  if i < 5
			  	a_new_stat = player.stats.create
					g = @game.active_away_players.create
					g.stat_id = a_new_stat.id
					g.save
			  else
			  	a_new_stat = player.stats.create
					g = @game.active_away_players.create
					g.stat_id = a_new_stat.id
					g.save
				end
				i+=1
		  end
  end
  
  def show
		@game = Game.find(params[:id])
  
    t1 = Team.find(1)
    t2 = Team.find(2)
    
    @game.game_seconds.delete_all
    @game.active_home_players.clear
    @game.inactive_home_players.clear
    @game.active_away_players.clear
    @game.inactive_away_players.clear
    @game.table_counter = 0
    @game.home_score = 0
    @game.away_score = 0
    @game.log_events.clear
		@game.clock_active=false
    i=0

		t1.players.each do | player |
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
	  
	  t2.players.each do | player |
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
