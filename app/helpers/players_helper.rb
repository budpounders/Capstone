module PlayersHelper
  STAT_HEADERS = ['Opp', 'FT / ATT', '2PT / ATT', '3PT / ATT', 'Assists', 'Blocks', 'Steals', '(O) Reb', '(D) Reb', 'T.O.', 'Fouls']
  
  def render_stat_headers
    render :partial=>'table_header', :collection => STAT_HEADERS
  end
end
