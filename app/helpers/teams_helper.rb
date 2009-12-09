module TeamsHelper
  STAT_HEADERS = ['Opp', 'Score', 'FT / ATT', '2PT / ATT', '3PT / ATT', 'Assists', 'Blocks', 'Steals', '(O) Reb', '(D) Reb', 'T.O.', 'Fouls']
  
   AVG_HEADERS = ['Avg Points', 'Assists', 'Blocks', 'Steals', '(O) Reb', '(D) Reb', 'T.O.', 'Fouls']
  
  def render_stat_headers
    render :partial=>'players/table_header', :collection => STAT_HEADERS
  end
  
  def render_avg_headers
    render :partial=>'table_header', :collection => AVG_HEADERS
  end
  
  def win_string(winner)
    case winner
      when @team.id then "Win"
      when 'tie' then 'Tie'
      else "Loss" 
    end
  end
  
  def score_string(game)
    if game.team1_id == @team.id
      "#{game.home_score}..#{game.away_score}"
    else
      "#{game.away_score}..#{game.home_score}"
    end
  end

  def record_string
    r = @team.record
    "#{r[0]} / #{r[1]} / #{r[2]}"
  end

end
