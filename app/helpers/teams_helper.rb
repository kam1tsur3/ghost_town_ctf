module TeamsHelper
  # 所属しているチームのID 
  def current_team(user)
    if user.team_id
      Team.find(user.team_id)
    else
      return nil
    end
  end
end
