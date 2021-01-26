require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @chall = Challenge.new(
      name: "Test",
      description: "this is test",
      flag: "flag{flag_is_here}",
      point: 100,
      category: "warmup",
      file_path: nil,
      active: true
    )
  end

  test "should be valid" do
    assert @chall.valid?
  end

  test "description should be present" do
    @chall.description = " "
    assert_not @chall.valid?
  end

  test "flag should be present" do
    @chall.flag = " "
    assert_not @chall.valid?
  end

  test "category should be present" do
    @chall.category = " "
    assert_not @chall.valid?
  end

  test "name should be unique" do
    duplicate_chall = @chall.dup
    @chall.save
    assert_not duplicate_chall.valid?
  end
end
