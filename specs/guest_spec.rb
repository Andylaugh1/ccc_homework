require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../bar.rb')

class GuestTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Andy", "Thunder Road", 20)

  end

  def test_get_name
    assert_equal("Andy", @guest1.name)
  end

end
