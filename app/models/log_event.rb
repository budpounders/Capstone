class LogEvent < ActiveRecord::Base
  belongs_to :game
  belongs_to :team

  before_destroy :kill_stat
  
  FIND_STRINGS={:free_throw=>"FreeThrow",
                :free_throw_miss=>"FreeThrowMiss",
                :two_point=>"TwoPoint",
                :two_point_miss=>"TwoPointMiss",
                :three_point=>"ThreePoint",
                :three_point_miss=>"ThreePointMiss",
                :assist=>"Assist",
                :offensive_rebound=>"OBound",
                :defensive_rebound=>"DBound",
                :steal=>"Steal",
                :block=>"Block",
                :turn_over=>"TurnOver",
                :personal_foul=>"PersonalFoul"}
                
  def stat
    eval "#{FIND_STRINGS[action.to_sym]}.find(#{stat_id})"
  end
  
  protected
    def kill_stat
      eval "#{FIND_STRINGS[action.to_sym]}.find(#{stat_id}).destroy"
    end
end
