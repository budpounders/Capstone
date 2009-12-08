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
  belongs_to :player
  has_one :active_home_player
  has_one :active_away_player
  has_one :inactive_home_player
  has_one :inactive_away_player
end
