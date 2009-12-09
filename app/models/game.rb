class Game < ActiveRecord::Base
  has_many :active_home_players
  has_many :inactive_home_players
  has_many :active_away_players
  has_many :inactive_away_players
  has_many :stats
  has_many :log_events
  
  LOG_MESSAGES={:free_throw=>"scores a free throw",
                :free_throw_miss=>"misses a free throw",
                :two_point=>"scores 2 points",
                :two_point_miss=>"misses a 2 pointer",
                :three_point=>"scores 3 points",
                :three_point_miss=>"misses a 3 pointer",
                :assist=>"registers an assist",
                :offensive_rebound=>"registers an offensive rebound",
                :defensive_rebound=>"registers a defensive rebound",
                :steal=>"registerse a steal",
                :block=>"registers a block",
                :turn_over=>"creates a turnover",
                :personal_foul=>"registers a personal foul"}
  
  def update_score(t_id, inc)
    if t_id == team1_id
      update_attribute :home_score, home_score + inc
    else
      update_attribute :away_score, away_score + inc
    end
  end

  def create_log_event(a_stat, time, action)
    log_events.create (:message=>"#{a_stat.player.number} #{a_stat.player.name} #{LOG_MESSAGES[action]} ||| #{time}")
    
  end
  
  def winner
    if home_score > away_score
      return team1_id
    elsif away_score > home_score
      return team2_id
    else
      return 'tie'
    end
  end
  
  def score_for_team(team)
    if team.id == team1_id
      home_score
    elsif team.id == team2_id
      away_score
    else
      -1
    end
  end

  def score_for_other_team(team)
    score_for_team( opponent_of(team) )
  end
  
  def opponent_of(team)
    team.id == team1_id ? Team.find(team2_id) : Team.find(team1_id)
  end

  def stats_for_team(team)
    stats.reject do |stat|
      stat.player.team_id != team.id
    end
  end

  def total_summary_for_team(team)
    
    total = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    stats_for_team(team).each do |stat|
      stat.summary.each_with_index do |s, i|
        puts "#{i}. #{total[i]}"
        total[i] += s
      end
    end
      
    total
  end
end
