class Team < ActiveRecord::Base
 validates_presence_of :name, :location
 
 has_many :players

 def player_attributes=(player_attributes)
   player_attributes.each do |attributes|
     players.build(attributes)
   end
 end
 
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
 
   games.each do |g|
     stat = g.stats_for_team(self)
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
 
 def games
   Game.find_all_by_team1_id(self.id) + Game.find_all_by_team2_id(self.id)
 end
 
end
