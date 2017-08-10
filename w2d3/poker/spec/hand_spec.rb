require 'hand'

describe 'Hand' do
  subject(:hand) { Hand.new }

  it "initializes with five cards" do
    expect(hand.hand.length).to eq(5)
  end
end
