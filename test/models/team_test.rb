require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @team = Team.new(name: "Example team",
      password: "password", password_confirmation: "password", leader_id: 1)
  end

  test "should be valid" do
    assert @team.valid?
  end

  test "team name should be present" do
    @team.name = " "
    assert_not @team.valid?
  end

  test "name should not be too long" do
    @team.name = "a"*51
    assert_not @team.valid?
  end

  test "team name should be unique" do
    duplicate_team = @team.dup
    @team.save
    assert_not duplicate_team.valid?
  end

  test "password should be present (nonblank)" do
    @team.password = @team.password_confirmation = " "*6
    assert_not @team.valid?
  end

  test "password should have a minimum length" do
    @team.password = @team.password_confirmation = "a"*5
    assert_not @team.valid?
  end
end
