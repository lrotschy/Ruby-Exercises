class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  attr_accessor :cards
  def initialize
    @cards = []
    set_deck
  end

  def set_deck
    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end

  def draw
    set_deck if cards.empty?
    cards.pop
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

  SUIT_VALUES = ['Spades', 'Hearts', 'Clubs', 'Diamonds']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    SUIT_VALUES.index(suit) <=> SUIT_VALUES.index(other.suit)
  end
end


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
