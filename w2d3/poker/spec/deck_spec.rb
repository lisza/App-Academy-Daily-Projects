require 'deck'

describe 'Deck' do
  subject(:deck) { Deck.new }
  let(:card) { double(:Card) }

  it "initializes with 52 cards" do
    expect(deck.cards.length).to eq(52)
  end

  it "contains card objects" do
    expect(deck.cards.sample).to be_a(Card)
  end

  it "contains four of a kind" do

    four_kings = deck.cards.select do |card|
      card.face == 12
    end

    expect(four_kings.length).to eq(4)
  end

end
