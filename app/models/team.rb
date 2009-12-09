class Team < ActiveRecord::Base
 validates_presence_of :name, :location
 
 has_many :players

  def player_attributes=(player_attributes)
   player_attributes.each do |attributes|
     players.build(attributes)
   end
 end
 
  def total_stats
    total = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    games.each do |g|
      g.stats_for_team(self).each do |stat|
        stat.summary.each_with_index do |s, i|
          total[i] += s
        end
      end
    end
    
    total
 end
 
  def record
    wins = 0
    losses = 0
    ties = 0
    
    games.each do |g|
      if g.winner == id
        wins += 1
      elsif g.winner == 'tie' 
        ties += 1
      else 
        losses+=1
      end
    end
    
    logger.debug "\n\n\nWINS: #{wins}, LOSSES: #{losses}, TIES: #{ties}\n\n\n"
    [wins, losses, ties]
  end
 
  
 
  def games
    Game.find_all_by_team1_id(self.id) + Game.find_all_by_team2_id(self.id)
  end
 
end
