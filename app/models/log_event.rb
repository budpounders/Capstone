class LogEvent < ActiveRecord::Base
  belongs_to :game

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
  
  protected
    def kill_stat
      logger.debug "\n\n\n" + "#{FIND_STRINGS[action]}.find(#{stat_id}).destroy" + "\n\n\n"
      eval "#{FIND_STRINGS[action.to_sym]}.find(#{stat_id}).destroy"
    end
end
