class GameSecond< ActiveRecord::Base
  belongs_to :game
  
  def to_param
    "#{id}"
  end
end
