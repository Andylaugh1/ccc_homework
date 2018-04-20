class Room

  attr_reader :name, :capacity, :entry_fee
  attr_accessor :guests, :playlist

  def initialize(name, guests, capacity, playlist, entry_fee)

    @name = name
    @guests = []
    @capacity = capacity
    @playlist = playlist
    @entry_fee = entry_fee

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

  def check_in_capacity(guest)
    if @guests.length < @capcity.to_i
      check_in_guest(guest)
    else
      return "Sorry this room is already full, try the other room"
    end
  end

  def guest_pay_entry(guest)
    if guest.money >= @entry_fee
      check_in_guest(guest)
      guest.money -= @entry_fee
    else
      return "Sorry, you don't have enough funds for this room!"
    end
  end

  def play_fav_song(guest)
    for song in @playlist
      if @playlist.include?(guest.fav_song)
        return "WoooHooooo!!!"
      else
        "That sucks"
      end
    end
  end

end
