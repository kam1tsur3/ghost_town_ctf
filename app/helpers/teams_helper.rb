module TeamsHelper
  # 所属しているチームのID 
  def current_team(user)
    if user.team_id
      Team.find(user.team_id)
    else
      return nil
    end
  end
  
  def not_belong_to_team
    redirect_to(root_url) unless current_user.team_id.nil?
  end

  def belong_to_team
    redirect_to(reg_team_path) if current_user.team_id.nil?
  end
end
