deck = [    
        ['H', '2'],
        ['H', '3'],
        ['H', '4'],
        ['H', '5'],
        ['H', '6'],
        ['H', '7'],
        ['H', '8'],
        ['H', '9'],
        ['H', '10'],
        ['H', 'J'],
        ['H', 'Q'],
        ['H', 'K'],
        ['H', 'A'],
      
        ['C', '2'],
        ['C', '3'],
        ['C', '4'],
        ['C', '5'],
        ['C', '6'],
        ['C', '7'],
        ['C', '8'],
        ['C', '9'],
        ['C', '10'],
        ['C', 'J'],
        ['C', 'Q'],
        ['C', 'K'],
        ['C', 'A'],
      
        ['S', '2'],
        ['S', '3'],
        ['S', '4'],
        ['S', '5'],
        ['S', '6'],
        ['S', '7'],
        ['S', '8'],
        ['S', '9'],
        ['S', '10'],
        ['S', 'J'],
        ['S', 'Q'],
        ['S', '1'],
        ['S', 'K'],
        ['S', 'A'],
      
        ['D', '2'],
        ['D', '3'],
        ['D', '4'],
        ['D', '5'],
        ['D', '6'],
        ['D', '7'],
        ['D', '8'],
        ['D', '9'],
        ['D', '10'],
        ['D', 'J'],
        ['D', 'Q'],
        ['D', 'K'],
        ['D', 'A']
       ]

player_cards = [['C', 'A'], ['D', '7']]
# player_cards = [deck.sample, deck.sample]
# player_cards.each { |card| deck.delete(card) }

p player_cards
p deck.length

dealer_cards = [deck.sample, deck.sample]
# dealer_cards.each { |card| deck.delete(card) }

p dealer_cards
p deck.length

current_set = player_cards

def card_values(value)
  case value
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  when '10' then 10
  when 'J' then 10
  when 'Q' then 10
  when 'K' then 10
  when 'A' then [1,11]
  end
end

def find_sum(cards)
  cards.reduce(0) do |sum, card|
    sum + card_values(card.last)
  end
end

def find_ace_value(sum)
  if sum <= 10
    11
  else
    1
  end
end

puts "Sum of values for player is: #{find_sum(player_cards)}."

current_set = dealer_cards
puts "Sum of values for dealer is: #{find_sum(dealer_cards)}."