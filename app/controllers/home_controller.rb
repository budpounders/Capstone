class HomeController < ApplicationController
  def index
    @teams = Team.all
    @last_game = Game.find(:all, :limit=>1, :order=>'created_at asc')[0]
  end
  
end
