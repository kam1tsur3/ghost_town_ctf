require 'test_helper'

class TeamsCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:km2)
    @in_team_user = users(:km3)
    @team = teams(:team1)
    @in_team_user.update_attribute(:team_id, @team.id)
    @team.update_attribute(:leader_id, @in_team_user.id)
  end

  test "create team with invalid information" do
    log_in_as @user
    get create_team_path
    assert_no_difference 'Team.count' do
      post teams_path, params: { 
        team: {
          name: "",
          password: "hoge",
          password_confirmation: "hoge"
        }
      }
    end
    assert_template 'teams/new'
  end

  test "crate team with valid information" do
    log_in_as @user
    get create_team_path
    assert_difference 'Team.count', 1 do
      post teams_path, params: {
        team: {
          name: "test team",
          password: "password",
          password_confirmation: "password"
        }
      }
    end
    follow_redirect!
    assert_template 'teams/show'
  end

  test "create team by invalid users" do
    log_in_as @in_team_user
    get create_team_path
    follow_redirect!
    assert_template 'static_pages/home' 
    post teams_path, params: {
      team: {
        name: "test team",
        password: "password",
        password_confirmation: "password"
      }
    }
    follow_redirect!
    assert_template 'static_pages/home' 
  end
end
