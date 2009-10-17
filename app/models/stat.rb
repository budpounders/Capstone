class Stat < ActiveRecord::Base
  has_many :free_throws
  has_many :free_throw_misses
  has_many :two_points
  has_many :two_point_misses
  has_many :three_points
  has_many :three_point_misses
  has_many :assists
  has_many :o_bounds
  has_many :d_bounds
  has_many :steals
  has_many :blocks
  has_many :personal_fouls
  belongs_to :player

  def to_param
    #"#{id}-#{name.gsub(/\w/, '-').downcase}"
    "#{id}"
  end
end
