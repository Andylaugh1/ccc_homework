class Room

  attr_reader :name, :capacity, :entry_fee
  attr_accessor :guests, :playlist, :bar_tab

  def initialize(name, guests=[], capacity, playlist, entry_fee, bar_tab)

    @name = name
    @guests = guests
    @capacity = capacity
    @playlist = playlist
    @entry_fee = entry_fee
    @bar_tab = bar_tab

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

  def guest_buy_drink(bar)
    @bar_tab += bar.drink_price
  end

  def guest_buy_food(bar)
    @bar_tab += bar.food_price
  end

  def guest_pay_bill()
    split = @guests.length
    if @guests.length == 0
      return "The guests have run away without paying!!"
    else
      bill = @bar_tab / split
      @guests.each { |g|
      g.money -= bill
      }
    end
    @bar_tab = 0
  end
end
