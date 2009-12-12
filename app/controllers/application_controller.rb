# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  protected
  
    def grab_time
      @time=""
      params.reject { |k, v| k !~ /what(.)/}.each {|k,v| @time= v}
    end
    
    def create_log_event(action, s)
      @new_log_event= @game.create_log_event @stat, @time, action, s
    end
    
end
