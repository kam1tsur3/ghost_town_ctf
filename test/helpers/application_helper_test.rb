require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    test "full title helper" do
        assert_equal full_title, Constants::CTF_NAME
        assert_equal full_title("Rule"), "Rule | #{Constants::CTF_NAME}"
    end
end