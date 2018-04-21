require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')

class BarTest < MiniTest::Test

  def setup

    @bar1 = Bar.new(3, 7)

  end

  def test_get_price_of_drink
    assert_equal(3, @bar1.drink_price)
  end

  def test_get_price_of_food
    assert_equal(7, @bar1.food_price)
  end
end
