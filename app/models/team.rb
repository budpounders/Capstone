class Team < ActiveRecord::Base
 validates_presence_of :name, :location
 
 has_many :players
 
  def to_param
    "#{id}-#{name.gsub(/\w/, '-').downcase}"
  end
end
