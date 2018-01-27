require_relative 'card'
require_relative 'player'
require 'byebug'
class War
  attr_reader :player1, :player2

  def initialize(name1, name2)
    #creates deck


    #splits deck amongst players

    #creates 2 players with respective piles

  end

  def play

  end

  def take_turn

  end

  def won?
    
  end

end

if __FILE__== $PROGRAM_NAME
  print "Please entere player 1 name : "
  name1 = gets.chomp
  print "Please entere player 2 name : "
  name2 = gets.chomp

  game = War.new(name1, name2)
  game.play
end
