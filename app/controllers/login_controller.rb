class LoginController < ApplicationController

  def index
    if params[:login]=='user' && params[:password] =='12345'
       redirect_to home_index_path
    else
      flash[:message] = 'Incorrect User information'
    end
  end
  
end