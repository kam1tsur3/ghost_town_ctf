require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # like constructor
  def setup
    @base_title = "Ghost Town CTF"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get rule" do
    get static_pages_rule_url
    assert_response :success
    assert_select "title", "Rule | #{@base_title}"
  end

end
