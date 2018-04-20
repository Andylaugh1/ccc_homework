require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class SongTest < MiniTest::Test

  def setup

    @song1 = Song.new("Disarm")

  end

  def test_get_song_title
    assert_equal("Disarm", @song1.title)
  end

end
