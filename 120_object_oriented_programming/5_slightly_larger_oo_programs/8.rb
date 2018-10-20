require 'pry'

class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def convert_to_numeric
    case rank
    when 2..10 then rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    end
  end

  def <=>(other_card)
    convert_to_numeric(rank) <=> convert_to_numeric(other_card.rank)
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards

  def initialize
    @cards = []
    reset
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end

  private

  def reset
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit) 
      end
    end

    @cards.shuffle!
  end

end

class PokerHand
  def initialize(hand)
    @hand = hand
    @suits = @hand.map(&:suit)
    @ranks = @hand.map(&:convert_to_numeric)
  end

  def print
    puts @hand
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
    winning_ranks = [10, 11, 12, 13, 14]
    all_same_suit? && @ranks.uniq.length == @ranks.length && @ranks.all? { |rank| winning_ranks.include?(rank) }
  end

  def straight_flush?
    all_same_suit? && consecutive_ranks?
  end

  def four_of_a_kind?
    max_count_of_same_rank == 4
  end

  def full_house?
    max_count_of_same_rank == 3 && min_count_of_same_rank == 2
  end

  def flush?
    all_same_suit?
  end

  def straight?
    consecutive_ranks?
  end

  def three_of_a_kind?
    max_count_of_same_rank == 3
  end

  def two_pair?
    @rank_count.values.count(2) == 2
  end

  def pair?
    max_count_of_same_rank == 2
  end

  private

  def all_same_suit?
    @suits.all? { |suit| suit == @suits.first }
  end

  def consecutive_ranks?
    index = 0
    sorted_ranks = @ranks.sort
    consecutivity = true

    while index < @ranks.length - 1
      first, second = sorted_ranks[index], sorted_ranks[index + 1]
      if second - first != 1
        consecutivity = false
      end

      index += 1
    end

    consecutivity
  end

  def max_count_of_same_rank
    unique_ranks = @ranks.uniq
    @rank_count = { }

    unique_ranks.each do |rank|
      @rank_count[rank] = @ranks.count(rank)
    end

    @rank_count.values.max
  end

  def min_count_of_same_rank
    @rank_count.values.min
  end
end

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
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'


hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'