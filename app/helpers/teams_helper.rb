module TeamsHelper
  STAT_HEADERS = ['Opp', 'Score', 'FT / ATT', '2PT / ATT', '3PT / ATT', 'Assists', 'Blocks', 'Steals', '(O) Reb', '(D) Reb', 'T.O.', 'Fouls']
  
  def render_stat_headers
    render :partial=>'players/table_header', :collection => STAT_HEADERS
  end
  
  def render_avg_headers
    render :partial=>'table_header', :collection => AVG_HEADERS
  end
end
