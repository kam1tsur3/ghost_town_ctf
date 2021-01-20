require 'test_helper'

class TeamsCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:km2)
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
end
