module PlayersHelper
  STAT_HEADERS = ['Opp', 'FT / ATT', '2PT / ATT', '3PT / ATT', 'Assists', 'Blocks', 'Steals', '(O) Reb', '(D) Reb', 'T.O.', 'Fouls']
  
  AVG_HEADERS = ['Avg Points', 'Assists', 'Blocks', 'Steals', '(O) Reb', '(D) Reb', 'T.O.', 'Fouls']

  
  def render_stat_headers
    render :partial=>'table_header', :collection => STAT_HEADERS
  end
  
  def render_avg_headers
    render :partial=>'table_header', :collection => AVG_HEADERS
  end
  
  def render_stat_rows

  end
  
  def win_string(winner)
    case winner
      when @player.team_id then "Win"
      when 'tie' then 'Tie'
      else "Loss" 
    end
  end

end
