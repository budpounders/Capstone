ActionController::Routing::Routes.draw do |map|
  map.resources :home

  map.resources :players

  map.resources :stats, :has_many => [ :free_throws, :free_throw_misses, :two_points, :two_point_misses, 
																		   :three_points, :three_point_misses, :assists, :o_bounds, :d_bounds,
																			 :steals, :blocks, :turn_overs, :personal_fouls ]
  map.resources :players , :has_many => :stats
  map.resources :teams, :has_many => :players
  map.resources :games, :has_many => [ :active_home_players , :inactive_home_players,
   																			:active_away_players , :inactive_away_players, :log_events, :game_seconds ]
  map.resource :home, :only=>:index
  map.root :controller=>'login'
  map.resources :login
  
  map.resource :assists, :only=>:destroy
  map.resource :log_events, :only=>:destroy
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
