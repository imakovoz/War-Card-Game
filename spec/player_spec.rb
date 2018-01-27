require 'rspec'
require 'player'
require 'card'
require 'game'

describe Player do
  let(:cards) do
    [Card.new(:hearts, :five),
     Card.new(:diamonds, :four),
     Card.new(:hearts, :four)]
  end
  subject(:player) {Player.new("test", cards.dup)}

  describe '#initialize' do
    it 'sets the players initial pile' do
      expect(player.pile).to eq(cards)
    end

    it 'sets the players name' do
      expect(player.name).to eq("test")
    end
  end

  describe '#count' do
    it 'correctly counts number of cards left' do
      expect(player.count).to eq(3)
    end

  end

  describe '#give_card' do
    it 'returns the top card from pile' do
      card = player.give_card
      expect(card).to eq(cards[0])
    end
    it 'removes card from pile' do
      card = player.give_card
      expect(player.pile).to eq([cards[1], cards[2]])
    end
    it 'returns error if not enough cards' do
      3.times do
        player.give_card
      end
      expect {player.give_card}.to raise_error('not enough cards')
    end
  end

  describe '#take_cards' do
    it 'returns one card to bottom of the pile' do
      card = Card.new(:hearts, :nine)
      expect(player.pile.length).to eq(3)
      player.take_cards([card])
      expect(player.pile[3]).to eq(card)
    end

    it 'returns multiple cards to bottom of the pile' do
      pot = [Card.new(:hearts, :nine), Card.new(:hearts, :jack)]
      expect(player.pile.length).to eq(3)
      player.take_cards(pot)
      expect(player.pile.length).to eq(5)
      expect(player.pile[3]).to eq(pot[0])
      expect(player.pile[4]).to eq(pot[1])
    end
  end

  describe '#lost' do
    it 'returns true if pile is empty' do
      expect(player.pile.length).to eq(3)
      3.times do
        player.give_card
      end
      expect(player.pile.length).to eq(0)
      expect(player.lost?).to eq(true)
    end

    it 'returns false if pile is not empty' do
      expect(player.lost?).to eq(false)
    end
  end
end
