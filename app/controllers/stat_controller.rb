class StatController < ApplicationController
  def index
  	@stat = Stat.find(1).name
  end

  def show
		@stat = Stat.find(params[:id])
  end

end
