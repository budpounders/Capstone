class Game < ActiveRecord::Base
  has_many :active_home_players
  has_many :inactive_home_players
  has_many :active_away_players
  has_many :inactive_away_players
  has_many :log_events
	has_many :game_seconds
	
	def start_time
	  self.game_seconds.first.created_at
	end
  
  def elapsed_seconds
    self.game_seconds.count
  end
  
  def to_param
    #"#{id}-#{name.gsub(/\w/, '-').downcase}"
    "#{id}"
  end
  
end
