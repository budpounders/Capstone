class TeamsController < ApplicationController
  def create
  end

  def show
  		@team = Team.find(params[:id])
  end

end
