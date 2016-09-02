require 'test_helper'

class RepeaterTest < ActiveSupport::TestCase
  test "invalid period" do
    date = Date.new 'Jan 1, 1964'
    assert_nil repeater( :one ).payment date
  end
end
