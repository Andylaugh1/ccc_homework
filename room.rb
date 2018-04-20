class Room

  attr_reader :name, :capacity
  attr_accessor :guests, :playlist

  def initialize(name, guests, capacity, playlist)

    @name = name
    @guests = []
    @capacity = capacity
    @playlist = playlist

  end

  def check_in_guest(guest)
    @guests << guest
  end

  def check_out_guest(guest)
    if @guests.include?(guest)
      @guests.remove
    else
      return "That guest is not even checked in!!"
    end
  end

  def add_song(song)
    if @playlist.include?(song)
      return "That song is already in the playlist!"
    else
      @playlist << song
    end
  end

  def check_in_fail(guest)
    if @guests.length < @capcity
      @guest.add
  end

end
