class ApplicationController < ActionController::Base
    # ここでincludeすると全てのcontrollerで使用できる
    include SessionsHelper
    include TeamsHelper
end