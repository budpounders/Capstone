class Player < ActiveRecord::Base
  validates_presence_of :name, :number
  
  has_many :stats
  has_many :games, :through=>:stats
  belongs_to :team
  
  attr_accessor :should_destroy
  
  
  def total_stats

    free_pts = 0
    free_pt_misses = 0
    two_pts = 0
    two_pt_misses = 0
    three_pts = 0
    three_pt_misses = 0
    assists = 0
    blocks = 0
    steals = 0
    obounds = 0
    dbounds = 0
    to = 0
    fouls = 0
      stats.each do |stat|
      free_pts += stat.free_throws.count
      free_pt_misses += stat.free_throw_misses.count
      two_pts += stat.two_points.count
      two_pt_misses += stat.two_point_misses.count
      three_pts += stat.three_points.count
      three_pt_misses += stat.three_point_misses.count
      assists += stat.assists.count
      blocks += stat.blocks.count
      steals += stat.steals.count
      obounds += stat.o_bounds.count
      dbounds += stat.d_bounds.count
      to += stat.turn_overs.count
      fouls += stat.personal_fouls.count
    end
    
    [free_pts, free_pt_misses+free_pts, two_pts, two_pt_misses + two_pts, three_pts, three_pt_misses + three_pts, assists, blocks, steals, obounds, dbounds, to, fouls]
  end
  
  def avg_stats
    
    free_pts = 0
    two_pts = 0
    three_pts = 0
    assists = 0
    blocks = 0
    steals = 0
    obounds = 0
    dbounds = 0
    to = 0
    fouls = 0
    
    stats.each do |stat|
      free_pts += stat.free_throws.count
      two_pts += stat.two_points.count
      three_pts += stat.three_points.count
      assists += stat.assists.count
      blocks += stat.blocks.count
      steals += stat.steals.count
      obounds += stat.o_bounds.count
      dbounds += stat.d_bounds.count
      to += stat.turn_overs.count
      fouls += stat.personal_fouls.count
    end
    
    game_count = stats.count
    
    if game_count > 0
      free_pts /= game_count
      two_pts /= game_count
      three_pts /= game_count
      assists /= game_count
      blocks /= game_count
      steals /= game_count
      obounds /= game_count
      dbounds /= game_count
      to /= game_count
      fouls /= game_count
    end
  
    [free_pts + two_pts * 2 + three_pts * 3, assists, blocks, steals, obounds, dbounds, to, fouls]
  end

  def should_destroy?
    should_destroy.to_i == 1
  end
end
