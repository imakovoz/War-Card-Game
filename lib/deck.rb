require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = (Card.suits).product(Card.values)
    cards.map {|x| Card.new(x[0], x[1])}
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.length
  end

  def empty?
    self.count == 0
  end

  # # Takes `n` cards from the top of the deck (front of the cards array).
  def take(n)
    raise "not enough cards" if n > self.count
    arr = []
    n.times do
      arr << @cards.shift
    end
    arr
  end

  # Returns an array of cards to the bottom of the deck (back of the cards array).
  def return(new_cards)
    @cards += new_cards
  end
end
