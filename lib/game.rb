require_relative 'card'
require_relative 'player'
require 'byebug'
class War
  attr_reader :player1, :player2

  def initialize(name1, name2)
    #creates deck
    deck = (Card.suits).product(Card.values).map {|x| Card.new(x[0], x[1])}.shuffle

    #splits deck amongst players
    pile1 = []
    pile2 = []
    deck.each_with_index do |card, i|
      if i.even?
        pile1 << card
      else
        pile2 << card
      end
    end
    #creates 2 players with respective piles
    @player1 = Player.new(name1, pile1)
    @player2 = Player.new(name2, pile2)
  end

  def play
    until won?
      puts "Current score: #{@player1.name} : #{@player1.count} vs #{@player2.name} : #{@player2.count}"
      take_turn
      #for display purposes uncomment the sleep method
      # sleep(1)
    end
    if @player1.lost?
      puts "#{@player2.name} you won!"
    else
      puts "#{@player1.name} you won!"
    end
  end

  def take_turn
    pot = []
    #loop till one player beats other
    winner = false
    until winner == true
      card1 = @player1.give_card
      card2 = @player2.give_card
      puts "#{card1} || #{card2}"
      case card1.rank <=> card2.rank
      when 0
        pot << card1
        pot << card2
        #breaks if one player runs out of cards
        break if won?
        #adds extra cards to pot
        pot << @player1.give_card
        pot << @player2.give_card
        puts "XX || XX"
      when -1
        pot << card1
        pot << card2
        @player2.take_cards(pot)
        puts "#{@player2.name} wins"
        winner = true
      when 1
        pot << card1
        pot << card2
        @player1.take_cards(pot)
        puts "#{@player1.name} wins"
        winner = true
      end
    end
  end

  def won?
    return true if @player1.lost? || @player2.lost?
    false
  end

end

print "Please entere player 1 name : "
name1 = gets.chomp
print "Please entere player 2 name : "
name2 = gets.chomp

game = War.new(name1, name2)
game.play
