require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count:1
    assert_select "a[href=?]", rule_path
    get rule_path
    assert_select "title", full_title("Rule")
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
