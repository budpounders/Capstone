class FreeThrow < ActiveRecord::Base
  validates_presence_of :stat_id
  belongs_to :stat
  
  def to_param
    "#{id}-#{name.gsub(/\w/, '-').downcase}"
  end
end
