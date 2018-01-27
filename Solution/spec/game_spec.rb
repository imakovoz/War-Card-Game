require 'rspec'
require 'game'

describe War do
  subject(:game) {War.new("test1", "test2")}
  describe '#initialize' do


    it 'Creates players with given names' do
      expect(game.player1.name).to eq("test1")
      expect(game.player2.name).to eq("test2")
    end

    it 'Splits a deck of 52 unique cards amongst 2 players' do
      expect(game.player1.pile.uniq.length).to eq(26)
      expect(game.player2.pile.uniq.length).to eq(26)
    end
  end

  describe '#won?' do
    it 'Returns true if either player has no cards left' do
      26.times do
        game.player1.give_card
      end
      expect(game.player1.pile).to eq([])
      expect(game.won?).to eq(true)
    end
    it 'Returns false if both players have cards' do
      expect(game.won?).to eq(false)
    end
  end

  describe '#take_turn' do
    it 'takes a card from each player' do
      game.player1.pile = [Card.new(:hearts, :nine), Card.new(:hearts, :four)]
      game.player2.pile = [Card.new(:hearts, :ten), Card.new(:hearts, :five)]
      game.take_turn
      expect(game.player1.pile.length).to eq(1)
    end

    it 'Gives winning player pot' do
      game.player1.pile = [Card.new(:hearts, :nine), Card.new(:hearts, :four)]
      game.player2.pile = [Card.new(:hearts, :ten), Card.new(:hearts, :five)]
      game.take_turn
      expect(game.player2.pile.length).to eq(3)
    end

    it 'If war pot takes additional card before resolving' do
      game.player1.pile = [Card.new(:hearts, :ten), Card.new(:hearts, :four), Card.new(:hearts, :three), Card.new(:hearts, :nine)]
      game.player2.pile = [Card.new(:hearts, :ten), Card.new(:hearts, :five), Card.new(:hearts, :seven), Card.new(:hearts, :eight)]
      game.take_turn
      expect(game.player1.pile.length).to eq(1)
      expect(game.player2.pile.length).to eq(7)
    end

    it 'It breaks out of game if a player runs out mid-war' do
      game.player1.pile = [Card.new(:hearts, :ten), Card.new(:hearts, :four)]
      game.player2.pile = [Card.new(:hearts, :ten), Card.new(:hearts, :five), Card.new(:hearts, :seven), Card.new(:hearts, :eight)]
      expect {game.take_turn}.to raise_error('not enough cards')
    end
  end
end
