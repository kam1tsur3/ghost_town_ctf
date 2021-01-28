class SubmitsController < ApplicationController
  #get /scoreboard
  def scoreboard
  end

  #post /submit
  def submit
    if true 
      flash[:success] = "You solved!"
    else
      flash[:danger] = "Wrong flag."
    end
    redirect_to challenges_path
  end
end
