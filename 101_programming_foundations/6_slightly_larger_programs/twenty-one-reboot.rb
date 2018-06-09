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
  when 'A' then {hard: 1, soft:11}
  end
end

player_cards = []
dealer_cards = []

def initialize_cards(deck, current_set)
  2.times do 
    new_card = deck.sample
    current_set << new_card
    deck.delete(new_card)
  end
  
end

def initial_value(card_set)
  return 12 if card_set[0][1] == 'A' && card_set[1][1] == 'A' # only hard hand possible initial hand

  card_set.reduce(0) do |sum, card|
    if card.last == 'A'
      sum + card_values(card.last)[:soft] # all soft hands except for the condition given on first line
    else
      sum + card_values(card.last)
    end
  end
end

def busted?()
end

initialize_cards(deck, player_cards)
initialize_cards(deck, dealer_cards)


puts "Dealer has: #{dealer_cards.sample[1]} and an unknown card."
puts "Player has: #{player_cards[0][1]} and #{player_cards[1][1]}."

p initial_value([],[]) == 22
p initial_value(dealer_cards)