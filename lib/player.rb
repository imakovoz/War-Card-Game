class Player
  attr_accessor :name, :pile

  def initialize(name, pile)
    @name = name
    @pile = pile
  end

  def give_card
    @pile.shift
  end

  def take_cards(arr)
    arr.each do |x|
      @pile << x
    end
  end

  def lost?
    @pile.length == 0
  end

  def count
    @pile.length
  end


end
