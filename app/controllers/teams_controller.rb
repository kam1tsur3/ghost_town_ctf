class TeamsController < ApplicationController
  # before_action :logged_in_user, only: []

  def new
    #ログインユーザかつチームに所属していない
    @team = Team.new
  end

  def show
    # ログインしているユーザのみ
    @team = Team.find(params[:id])
    @leader = User.find(@team.leader_id)
  end

  def index
  end

  def create
    #newで使用するパス
    #ログイン済ユーザかつチームに所属していない
    @team = Team.new(team_params)
    @user = current_user
    @team.leader_id = @user.id
    if @team.save
      #
      @team.reload
      @user.update_attribute(:team_id, @team.id)
      flash[:success] = "Created new team"
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    #アドミンだけでいいかな
  end

  def update
    #アドミンだけでいいかな
  end

  def delete
    #アドミンだけでいいかな
  end

  private 
    def team_params
      params.require(:team).permit(:name, :password, :password_confirmation)
    end
end
