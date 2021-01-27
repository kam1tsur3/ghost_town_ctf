require 'test_helper'

class AddChallTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @admin = users(:km2)
    @not_admin = users(:km3)
  end

  test "should redirect by access of non admin" do
    log_in_as(@not_admin)
    # new
    get challenges_new_path
    assert_redirected_to root_url
    # create
    post challenges_path, params: { challenge: {
      name: "test",
      description: "this is test",
      flag: "flag{flag}",
      point: 100,
      category:  "test",
      active: true
    }}
    assert_redirected_to root_url
  end

  test "should be fail with invalid information" do
    log_in_as(@admin)
    assert_no_difference 'Challenge.count' do
      post challenges_path, params: { challenge: {
        name: " ",
        description: " ",
        flag: " ",
        point: 100,
        category:  " ",
        active: true
      }}
    end
    assert_template 'challenges/new'
  end

  test "should be success with valid information" do
    log_in_as(@admin)
    assert_difference 'Challenge.count', 1 do
      post challenges_path, params: { challenge: {
        name: "test",
        description: "this is test",
        flag: "flag{flag}",
        point: 100,
        category:  "test",
        active: true
      }}
    end
    assert_redirected_to challenges_path
  end
end
