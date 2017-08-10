require "card"

describe "Card" do
  subject(:card) { Card.new(:hearts, :king) }

  it "it initializes card with suit" do
    expect(card.suit).to eq(:hearts)
  end

  it "initializes card with face" do
    expect(card.face).to eq(:king)
  end
end
