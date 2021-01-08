require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # like constructor
  def setup
    @base_title = Constants::CTF_NAME
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get rule" do
    get rule_path
    assert_response :success
    assert_select "title", "Rule | #{@base_title}"
  end

end
