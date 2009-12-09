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
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])
  
    if @team.update_attributes(params[:team])
      flash[:notice] = 'Model was successfully updated.'
      redirect_to @team
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    
    redirect_to root_url
  end
end



