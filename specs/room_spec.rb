require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../bar.rb')

class RoomTest < MiniTest::Test

  def setup

    @bar1 = Bar.new(3, 7)

    @song1 = Song.new("Serenata Immortale")
    @song2 = Song.new("You Know My Name")

    @guest1 = Guest.new("Andy", "Thunder Road", 20)
    @guest2 = Guest.new("Ali", "Animal Nitrate", 30)
    @guest3 = Guest.new("Eilidh", "Baa Baa Black Sheep", 10)

    @room1 = Room.new("Rock", [], 0, ["Disarm", "Home", "Animal Nitrate"], 15, 0)
    @room2 = Room.new("Pop", [@guest2, @guest3], 0, ["Wuthering Heights", "Night Fever", "Suspicious Minds"], 10, 10)

  end

  def test_get_name
    assert_equal("Rock", @room1.name)
  end

  def test_get_capacity
    assert_equal(0, @room1.capacity)
  end

  def test_get_guests
    assert_equal([], @room1.guests)
  end

  def test_get_playlist
    assert_equal(["Wuthering Heights", "Night Fever", "Suspicious Minds"], @room2.playlist)
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest1)
    assert_equal("Andy", @guest1.name)
  end

  def test_check_out_guest
    @room1.check_out_guest(@guest1)
    assert_equal([], @room1.guests)
  end

  def test_add_song_to_room
    @room2.add_song(@song1)
    assert_equal(4, @room2.playlist.length)
  end

  def test_check_in_capacity_fail
    failed_check_in = @room1.check_in_capacity(@guest1)
    assert_equal("Sorry this room is already full, try the other room", failed_check_in)
  end

  def test_check_in_capacity_pass
    checked_in = @room2.check_in_capacity(@guest2)
    assert_equal("Ali", @guest2.name)
  end

  def test_guest_pay_entry_fee__sufficient_funds
    payment = @room1.guest_pay_entry(@guest1)
    assert_equal(5, @guest1.money)
  end

  def test_guest_pay_entry_fee__insufficient_funds
    payment = @room1.guest_pay_entry(@guest3)
    assert_equal("Sorry, you don't have enough funds for this room!", payment)
  end

  def test_does_room_play_favourite_song__yes
    play_song = @room1.play_fav_song(@guest2)
    assert_equal("WoooHooooo!!!", play_song)
  end

  def test_add_drink_to_room_bar_tab
    add_drink = @room1.bar_tab += @bar1.drink_price
    assert_equal(3, @room1.bar_tab)
  end

  def test_add_food_to_room_bar_tab
    add_food = @room2.bar_tab += @bar1.food_price
    assert_equal(17, @room2.bar_tab)
  end

  def test_guest_pay_bar_bill__guest_present
    pay_bill = @room2.guest_pay_bill()
    assert_equal(25, @guest2.money)
    assert_equal(5, @guest3.money)
  end

  def test_guest_pay_bar_bill__no_guest
    avoid_bill = @room1.guest_pay_bill()
    assert_equal("The guests have run away without paying!!", avoid_bill)
  end
end
