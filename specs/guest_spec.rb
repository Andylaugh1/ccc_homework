require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class GuestTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Andy", "Thunder Road")

  end

  def test_get_name
    assert_equal("Andy", @guest1.name)
  end

end
