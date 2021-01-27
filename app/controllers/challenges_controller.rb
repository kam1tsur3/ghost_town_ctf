class ChallengesController < ApplicationController
  before_action :logged_in_user, only: 
    [:new, :create, :show, :index, :edit, :update, :destroy, :download]
  before_action :admin_user, only: 
    [:new, :create, :edit, :update, :destroy]
  
  def new
    @chall = Challenge.new
  end

  def create 
    tmp = chall_params
    upload_file = file_path_params[:file_path]
    
    if upload_file &.original_filename
      tmp[:file_path] = 
        Rails.root.join('public', 'chall', (Challenge.count+1).to_s, upload_file.original_filename)
      Dir::mkdir(Rails.root.join('public', 'chall', (Challenge.count+1).to_s))
      File.open(tmp[:file_path], 'w+b') do |fp|
        fp.write upload_file.read
      end
    end

    @chall = Challenge.new(tmp)
    if @chall.save
      flash[:success] = "Create new challenge."
      redirect_to challenges_path
    else
      render 'new'
    end
  end
  
  def show
    @chall = Challenge.find(params[:id])
  end

  def index
    @challs = Challenge.all 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # original
  def download
    @chall = Challenge.find(params[:chall_id])
    if @chall.file_path
      send_file @chall.file_path
    else
      redirect_to root_path
    end
  end

  private 
    def chall_params
      params.require(:challenge).permit(
        :name, :description, :flag, :point, 
        :category, :active
      )
    end

    def file_path_params
      params.require(:challenge).permit(:file_path)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
