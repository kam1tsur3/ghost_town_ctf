class TeamsController < ApplicationController
  before_action :logged_in_user, only: 
    [:new, :create, :reg_team, :join_form, :join_team, :my_team]
  before_action :not_belong_to_team, only: 
    [:new, :create, :reg_team, :join_form, :join_team]

  def new
    #ログインユーザかつチームに所属していない
    @team = Team.new
  end

  def show
    # ログインしているユーザのみ
    @team = Team.find(params[:id])
    @members = User.where(team_id: @team.id)
    @leader = User.find(@team.leader_id)
  end

  def index
    @teams = Team.paginate(page: params[:page])
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
    #leader, adminだけでいいかな
  end

  def update
    #leader, adminだけでいいかな
  end

  def delete
    #アドミンだけでいいかな
  end

  # RESTfulじゃない独自パス

  # GET /join 
  def join_form
  end

  # POST /join 
  def join_team
    user = current_user
    team = Team.find_by(name: params[:name])
    if user && team && team.authenticate(params[:password])
      user.update_attribute(:team_id, team.id)
      flash[:success] = "Successfully join team"
      redirect_to team
    else 
      flash.now[:danger] = "Invalid team infomation"
      render 'teams/join_form'
    end
  end

  # 作成するか既存のチームに参加するか
  def reg_team
  end

  def my_team
    if @team = current_team(current_user)
      redirect_to @team
    else
      redirect_to reg_team_path
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
