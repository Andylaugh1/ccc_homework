class Guest

  attr_reader :name, :fav_song
  attr_accessor :money

  def initialize(name, fav_song, money)

    @name = name
    @fav_song = fav_song
    @money = money

  end

end
