require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get create_team_url
    assert_response :success
  end

end
