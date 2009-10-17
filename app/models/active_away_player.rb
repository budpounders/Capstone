class ActiveAwayPlayer < ActiveRecord::Base
	belongs_to :game
	
	def to_param
    #{}"#{id}-#{name.gsub(/\w/, '-').downcase}"
    "#{id}"
  end
end
