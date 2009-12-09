class Team < ActiveRecord::Base
  validates_presence_of :name, :location
 
  has_many :players
  has_many :log_events
  after_update :save_players

  def player_attributes=(player_attributes)
  
    player_attributes.each do |attributes|
      if attributes[:id].blank?
        players.build(attributes)
      else
        player = players.detect { |t| t.id == attributes[:id].to_i }
        player.attributes = attributes
      end
    end
    
 end
 
  def player_attributes
    players.collect { |p| p.attributes }
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
 
  def avg_stats
    total_stats.collect { |s| game_count < 1  && game_count > 0 ? s / game_count : s  } 
  end
 
  def avg_points
    averaged = avg_stats
    avg_stats[0] + avg_stats[2] * 2 + avg_stats[4] * 3
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
    
    [wins, losses, ties]
  end
 
  def games
    Game.find_all_by_team1_id(self.id) + Game.find_all_by_team2_id(self.id)
  end

  def game_count
    games.size
  end
  
  protected
    def save_players
      players.each do |p|
        if p.should_destroy?
          p.destroy
        else
          p.save(false)
        end
      end
    end
end
