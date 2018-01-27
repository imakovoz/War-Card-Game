require 'rspec'
require 'game'

describe War do

  describe '#initialize' do
    subject(:game) {War.new("test1", "test2")}

    it 'Creates players with given names' do
      expect(game.player1.name).to eq("test1")
      expect(game.player2.name).to eq("test2")
    end

    it 'Splits a deck of 52 unique cards amongst 2 players' do
      expect(game.player1.pile.uniq.length).to eq(26)
      expect(game.player2.pile.uniq.length).to eq(26)
    end
  end

end
