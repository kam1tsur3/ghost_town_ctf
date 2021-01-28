require 'test_helper'

class SubmitsControllerTest < ActionDispatch::IntegrationTest
  test "should get scoreboard" do
    get submits_scoreboard_url
    assert_response :success
  end

end
