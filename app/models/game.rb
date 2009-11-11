class Game < ActiveRecord::Base
  has_many :active_home_players
  has_many :inactive_home_players
  has_many :active_away_players
  has_many :inactive_away_players
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
  
  def to_param
    #"#{id}-#{name.gsub(/\w/, '-').downcase}"
    "#{id}"
  end
  
end
