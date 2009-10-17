class Player < ActiveRecord::Base
  validates_presence_of :name, :number
  
  has_many :stats
  belongs_to :team
  
  def to_param
    "#{id}-#{name.gsub(/\w/, '-').downcase}"
  end
end
