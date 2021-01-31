module SubmitsHelper
  def user_submit(user_id)
    Submit.where(user_id: user_id)
  end

  def team_submit(team_id)
    Submit.where(team_id: team_id)
  end

  def get_scoreboard
    #{team_id: , point: , last_submit:}
    scores = []
    Submit.all.each do |submit|
      if idx = scores.find_index{|s| s[:team_id] == submit.team_id}
        scores[idx][:point] += Challenge.find(submit.chal_id).point
        if scores[idx][:last_submit] < submit.created_at
          scores[idx][:last_submit] = submit.created_at
        end
      else
        scores << {team_id: submit.team_id, point: Challenge.find(submit.chal_id).point, last_submit: submit.created_at}
      end
    end
    scores.sort! do |a, b|
      [-a[:point], a[:last_submit]] <=> [-b[:point], b[:last_submit]]
    end
    return scores
  end

  def team_rank(team_id)
    #get_scoreboardから該当行を取り出す
    scores = get_scoreboard
    if idx = scores.find_index{|s| s[:team_id] == team_id}
      return {place: idx+1, point: scores[idx][:point]}
    else
      return nil
    end
  end
end
