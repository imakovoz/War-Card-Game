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

  
end
