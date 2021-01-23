require 'test_helper'

class JoinTeamTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @in_team_user = users(:km3)
    @not_in_team_user = users(:km4)
    @team = teams(:team1)
    @in_team_user.update_attribute(:team_id, @team.id)
    @team.update_attribute(:leader_id, @in_team_user.id)
  end

  test "should not join team by invalid user" do
    log_in_as(@in_team_user)
    get join_path
    assert_redirected_to root_url

    post join_path, params: {
      name: @team.name,
      password: "password"
    }
    assert_redirected_to root_url
  end

  test "should join team by valid user with invalid info" do
    log_in_as(@not_in_team_user)
    get join_path
    assert_template 'teams/join_form'
    
    post join_path, params: {
      name: @team.name,
      password: "fuck"
    }
    assert_not flash.empty?
    assert_template 'teams/join_form'
  end

  test "should join team by valid user with valid info" do
    log_in_as(@not_in_team_user)
    get join_path
    assert_template 'teams/join_form'
    
    post join_path, params: {
      name: @team.name,
      password: "password"
    }
    assert_redirected_to @team
  end
end
