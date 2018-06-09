SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
          'Jack', 'Queen', 'King', 'Ace']

WINNING_VALUE = 31
DEALER_THRESHOLD = WINNING_VALUE - 4

score = {
  'Player' => 0,
  'Dealer' => 0
}

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def human_readable_cards(cards)
  cards.map do |card|
    "'#{card[1]} of #{card[0]}'"
  end
end

def joinand(arr, separator = ', ', joining_word = 'and')
  arr.reduce("") do |sentence, val|
    sentence += joining_word + ' ' if val == arr.last && arr.size != 1
    sentence += val.to_s

    # changed from joinor from TTT because didn't want the separator (,)
    # before joining word
    separator = ' ' if arr.size == 2 || val == arr[arr.size - 2]
    sentence += separator unless val == arr.last
    sentence
  end
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == 'Ace'
             11
           elsif value.to_i == 0 # Jack, Queen or King
             10
           else
             value.to_i
           end
  end

  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > WINNING_VALUE
  end

  sum
end

def busted?(total_value)
  total_value > WINNING_VALUE
end

def detect_result(dealer_total, player_total)
  if player_total > WINNING_VALUE
    :player_busted
  elsif dealer_total > WINNING_VALUE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def update_score(dealer_total, player_total, scr)
  winner = detect_result(dealer_total, player_total)
  if [:player, :dealer_busted].include?(winner)
    scr['Player'] += 1
  elsif [:dealer, :player_busted].include?(winner)
    scr['Dealer'] += 1
  end
end

def five_wins_reached?(scr)
  scr['Player'] == 5 || scr['Dealer'] == 5
end

def overall_winner(scr)
  scr.key(5)
end

def grand_output(dealer_cards_display, player_cards_display,
                 dealer_total, player_total)
  puts "=============="
  prompt "Dealer has #{joinand(dealer_cards_display)} for" \
         " a total of: #{dealer_total}"
  prompt "Player has #{joinand(player_cards_display)} for" \
         " a total of: #{player_total}"
  puts "=============="
end

def display_result(dealer_cards_display, player_cards_display,
                   dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins."
  when :dealer_busted
    prompt "Dealer busted! Player wins."
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end

  grand_output(dealer_cards_display, player_cards_display,
               dealer_total, player_total)
end

def play_again?
  answer = ''
  loop do
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp

    if ['y', 'n'].include?(answer.downcase)
      break
    else
      prompt "Please choose between 'y or n'"
    end
  end
  answer.downcase == 'y'
end

loop do
  system 'clear'
  prompt "Welcome to Whatever-One!"
  prompt "For this iteration, winning value is #{WINNING_VALUE}."
  puts

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initialize deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  player_cards_display = human_readable_cards(player_cards)
  dealer_cards_display = human_readable_cards(dealer_cards)

  prompt "SCORE Player: #{score['Player']}, Dealer: #{score['Dealer']}"
  prompt "First to get to five wins is the overall winner."
  puts
  prompt "Dealer has #{dealer_cards_display[0]} and ?"
  prompt "You have: #{joinand(player_cards_display)}"
  prompt "Your total is: #{player_total}"

  # player turn
  loop do
    player_turn = ''
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, you must enter 'h' or 's'."
    end

    if player_turn == 'h'
      prompt "You chose to hit!"

      player_cards << deck.pop
      player_cards_display = human_readable_cards(player_cards)

      prompt "You got #{player_cards_display.last}"
      prompt "Your cards are now: #{joinand(player_cards_display)}"
      player_total = total(player_cards)
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_total)
  end

  if busted?(player_total)
    update_score(dealer_total, player_total, score)

    display_result(dealer_cards_display, player_cards_display,
                   dealer_total, player_total)

    break if five_wins_reached?(score)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= DEALER_THRESHOLD

    prompt "Dealer hits!"

    dealer_cards << deck.pop
    dealer_cards_display = human_readable_cards(dealer_cards)
    prompt "Dealer got #{dealer_cards_display.last}"

    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{joinand(dealer_cards_display)}"
    prompt "Dealer total is now: #{dealer_total}"
  end

  if busted?(dealer_total)
    update_score(dealer_total, player_total, score)

    display_result(dealer_cards_display, player_cards_display,
                   dealer_total, player_total)

    break if five_wins_reached?(score)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stay - compare cards
  update_score(dealer_total, player_total, score)

  display_result(dealer_cards_display, player_cards_display,
                 dealer_total, player_total)

  break if five_wins_reached?(score)
  break unless play_again?
end

if five_wins_reached?(score)
  prompt "#{overall_winner(score)} is the overall winner" \
         " after reaching five wins."
end

prompt "Thank you for playing Whatever-One" \
       " (with winning value of #{WINNING_VALUE}). Goodbye!"
