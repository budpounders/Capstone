class Team < ActiveRecord::Base
 validates_presence_of :name, :location
 
 has_many :players

 def player_attributes=(player_attributes)
   player_attributes.each do |attributes|
     players.build(attributes)
   end
 end
 
  def to_param
    "#{id}-#{name.gsub(/\w/, '-').downcase}"
  end
end
