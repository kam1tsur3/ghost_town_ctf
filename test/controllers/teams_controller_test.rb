require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @in_team_user = users(:km3)
    @not_in_team_user = users(:km4)
    @team = teams(:team1)
    @in_team_user.update_attribute(:team_id, @team.id)
    @team.update_attribute(:leader_id, @in_team_user.id)
  end

  test "should get new" do
    get create_team_url
    #assert_response :success
  end

  test "should get my_team" do
    log_in_as(@in_team_user)
    get my_team_path
    follow_redirect!
    assert_template 'teams/show'

    log_in_as(@not_in_team_user)
    get my_team_path
    assert_template 'teams/reg_team'
  end
end
