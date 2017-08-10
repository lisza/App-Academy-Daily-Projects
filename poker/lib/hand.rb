require_relative 'deck'

class Hand
  attr_reader :deck, :hand

  def initialize
    @deck = Deck.new.dup
    @hand = @deck.cards.shuffle.take(5)
  end

  def pair?
    temp = []
    @hand.each do |card|
      temp << card.face unless temp.include?(card.face)
    end
    return true if temp.length < 5
    false
  end

end
