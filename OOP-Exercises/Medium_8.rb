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
    if rank != other.rank
      VALUES[rank] <=> VALUES[other.rank]
    else
      SUIT_VALUES.index(suit) <=> SUIT_VALUES.index(other.suit)
    end
  end
end

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

end

hand1 = Hand.new
hand1.cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts hand1.cards
puts hand1.cards.min == Card.new(2, 'Hearts')
puts hand1.cards.max == Card.new('Ace', 'Clubs')

hand2 = Hand.new
hand2.cards = [Card.new(5, 'Hearts')]
puts hand2.cards.min == Card.new(5, 'Hearts')
puts hand2.cards.max == Card.new(5, 'Hearts')

hand3 = Hand.new
hand3.cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts hand3.cards.min.rank == 4
puts hand3.cards.max == Card.new(10, 'Clubs')

hand4 = Hand.new
hand4.cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts hand4.cards.min == Card.new(7, 'Diamonds')
puts hand4.cards.max.rank == 'Jack'

hand5 = Hand.new
hand5.cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts hand5.cards.min.rank == 8
puts hand5.cards.max.rank == 8

hand6 = Hand.new
hand6.cards = [Card.new(5, 'Spades'), Card.new(5, "Hearts"), Card.new(5, "Clubs"), Card.new(5, 'Diamonds')]
puts hand6.cards.min
puts hand6.cards.max
