class TeamsController < ApplicationController
  def create
    @team = Team.new(params[:team])
    
    if @team.save
      flash[:notice] = "Successfully created new team."
      redirect_to '/home'
    else
      render :action => 'new'
    end
  end

  def show
  		@team = Team.find(params[:id])
  end
  
  def new
    @team=Team.new

    
  end

end
