class SubmitsController < ApplicationController
  before_action :logged_in_user, only:
    [:submit]
  before_action :belong_to_team, only:
    [:submit]

  #get /scoreboard
  def scoreboard
    @ranks = get_scoreboard
  end

  #post /submit
  def submit
    user = current_user
    team_id = user.team_id
    chall = Challenge.find(params[:chall_id])
    if Submit.where(team_id: team_id).where(chal_id: chall.id).length != 0
      flash[:info] = "Your team have already solved this challenge"
      #
      redirect_to challenges_path
    else
      if chall.flag === params[:flag]
        submit = Submit.new(chal_id: chall.id, team_id: team_id,user_id: user.id)
        if submit.save
          dinamic_score(chall)
          flash[:success] = "You solved!"
          redirect_to challenges_path
        else
          flash[:danger] = "Some Error happen"
          redirect_to root_url
        end
      else
        flash[:danger] = "Wrong flag."
        redirect_to chall
      end
    end
  end

  private
    def dinamic_score(chall)
      if (chall.point - 10) >= 50
        chall.update_attribute(:point, chall.point-10)
      else
        chall.update_attribute(:point, 50)
      end
    end
end
