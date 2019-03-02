require 'pry'

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  new_card = cards.pop
  player_cards << new_card
  # binding.pry
end

# Determine the score of the remaining cards in the deck
p player_cards
p deck[:hearts].length
p deck[:diamonds].length
p deck[:clubs].length
p deck[:spades].length
p deck[:spades]

sum = deck.reduce(0) do |sum, (_, cards)|
        card_values = cards.map do |card|
                        score(card)
                      end

        sum + card_values.sum
      end

puts sum