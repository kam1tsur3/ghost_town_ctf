class TeamsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :my_team]
  before_action :not_belong_to_team, only: [:new, :create]

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

  # RESTfulじゃない独自パス

  def join
  end

  # 作成するか既存のチームに参加するか
  def reg_team
  end

  def my_team
    if @team = current_team(current_user)
      redirect_to @team
    else
      render 'reg_team'
    end
  end

  private 
    def team_params
      params.require(:team).permit(:name, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location 
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def not_belong_to_team
      redirect_to(root_url) unless current_user.team_id.nil?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
