class Stat < ActiveRecord::Base
  has_many :free_throws
  has_many :free_throw_misses
  has_many :two_points
  has_many :two_point_misses
  has_many :three_points
  has_many :three_point_misses
  has_many :assists
  has_many :o_bounds
  has_many :d_bounds
  has_many :steals
  has_many :blocks
  has_many :turn_overs
  has_many :personal_fouls
  
  has_one :active_home_player
  has_one :active_away_player
  has_one :inactive_home_player
  has_one :inactive_away_player
  
  belongs_to :player
  belongs_to :game
  
  def summary
    [free_throws.count, free_throw_misses.count + free_throws.count, two_points.count, two_point_misses.count + two_points.count, three_points.count, three_point_misses.count + three_points.count, assists.count, o_bounds.count, d_bounds.count, steals.count, blocks.count, turn_overs.count, personal_fouls.count]
  end
  
  def score_str
    "#{game.score_for_team(player.team.id)}... #{game.score_for_other_team(player.team.id)}"
  end

end
