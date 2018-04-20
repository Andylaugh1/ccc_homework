require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomTest < MiniTest::Test

  def setup

    @song1 = Song.new("Serenata Immortale")
    @song2 = Song.new("You Know My Name")

    @guest1 = Guest.new("Andy", "Thunder Road")
    @guest2 = Guest.new("Ali", "Animal Nitrate")
    @guest3 = Guest.new("Eilidh", "Baa Baa Black Sheep")

    @room1 = Room.new("Rock", [], 2, ["Disarm", "Home", "Piano Man"])
    @room2 = Room.new("Pop", [], 2, ["Wuthering Heights", "Night Fever", "Suspicious Minds"])

  end

  def test_get_name
    assert_equal("Rock", @room1.name)
  end

  def test_get_capacity
    assert_equal(3, @room1.capacity)
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

  def test_check_in_fail_capacity_max
    failed_check_in = @room1.check_in_fail(@guest1)
    assert_equal("Sorry this room is already full, try the other room", failed_check_in)
  end


end
