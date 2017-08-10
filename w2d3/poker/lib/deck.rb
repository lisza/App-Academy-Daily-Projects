require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = make_deck
  end

  def make_deck
    suits = [:clubs, :spades, :hearts, :diamonds]
    faces = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

    deck = []
    suits.each do |suit|
      faces.each do |face|
        deck << Card.new(suit, face)
      end
    end

    deck
  end
end
