# Medium_10.rb
require 'pry'
require 'pry-byebug'
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

  # VALUES = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}
  RANKS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SUIT_VALUES = ['Spades', 'Hearts', 'Clubs', 'Diamonds']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    RANKS.index(rank) <=> RANKS.index(other.rank)
  end
end

class PokerHand
  attr_accessor :hand, :deck

  def initialize(deck)
    @deck = deck
    @hand = []
    deal_hand
  end

  def deal_hand
    5.times {hand << deck.draw}
  end

  def print
    hand.each do |card|
      puts "#{card}"
    end
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    Card::SUIT_VALUES.any? do |suit_value|
      ['Ace', 'King', 'Queen', 'Jack', 10].all? do |rank|
        hand.any? do |card|
          card.rank == rank && card.suit == suit_value
        end
      end
    end
  end

  def straight_flush?
    Card::SUIT_VALUES.any? do |suit_value|
      ['Queen', 'Jack', 10, 9, 8].all? do |rank|
        hand.any? do |card|
          card.rank == rank && card.suit == suit_value
        end
      end
    end
  end

  def four_of_a_kind?
    Card::RANKS.any? do |rank_value|
      hand.select { |card| card.rank == rank_value }.length == 4
    end
  end

  def full_house?

    rank1 = Card::RANKS.any? do |rank_value|
      hand.select { |card| card.rank == rank_value }.length == 3
    end

    rank2 = Card::RANKS.any? do |rank_value|
      hand.select { |card| card.rank == rank_value }.length == 2
    end

    rank1 && rank2 && !four_of_a_kind?
  end

  def flush?
    Card::SUIT_VALUES.any? do |suit_value|
      hand.all? { |card| card.suit == suit_value }
    end
  end

  def straight?
    # 5 cards rank in order any suit
    # ace = high
    (0..9).any? do |starting_index|
      (starting_index..(starting_index + 4)).all? do |index|
        hand.any? do |card|
          card.rank == Card::RANKS[index]
        end
      end
    end
  end

  def three_of_a_kind?
    # 3 cards same rank
    three = Card::RANKS.any? do |rank_value|
      hand.select { |card| card.rank == rank_value }.length == 3
    end
    three && !four_of_a_kind?
  end

  def two_pair?
    rank_pairs = Card::RANKS.combination(2).to_a
    rank_pairs.any? do |pair|
      pair.all? do |rank_value|
        hand.select { |card| card.rank == rank_value }.length == 2
      end
    end
  end

  def pair?
    pair = Card::RANKS.any? do |rank_value|
      hand.select { |card| card.rank == rank_value }.length == 2
    end
    pair && !two_pair?
  end

end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts "royal flush"
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts 'straight flush'
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts 'four'
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts 'full house'
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts 'flush'
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts 'straight'
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts 'straight'
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts 'three'
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts 'two pair'
puts hand.evaluate #== 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts 'pair'
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts 'high card'
puts hand.evaluate == 'High card'
