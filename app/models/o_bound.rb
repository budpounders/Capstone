class OBound < ActiveRecord::Base
  validates_presence_of :stat_id
  belongs_to :stat  
end
