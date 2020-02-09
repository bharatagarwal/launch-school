class Deck
  SUITS = [:hearts, :spades, :clubs, :diamonds]
  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

  attr_reader :cards
  def initialize
    @cards = SUITS.product(VALUES).shuffle
  end
end

class Card
  def initialize
    
  end
end

class Participant
  attr_reader :cards

  def initialize(name)
    @cards = []
    @name = name
  end

  def total
    values = cards.map { |card| card[1] }

    values.reduce(0) do |sum, value|
      if value == 'A' && sum + 11 <= MAX_VALUE
        sum + 11
      elsif value == 'A'
        sum + 1
      elsif value.to_i == 0
        sum + 10
      else
        sum + value.to_i
      end
    end
  end

  def busted?
    total > MAX_VALUE
  end

  def hit(deck)
    @cards << deck.cards.pop
  end
end

class Player < Participant
end

class Dealer < Participant
  def deal(player, deck)
    2.times do
      player.cards << deck.cards.pop
      cards << deck.cards.pop
    end
  end
end

class Game
  attr_reader :player, :dealer, :deck
MAX_VALUE = 21

  def initialize
    @deck = Deck.new
    @player = Player.new('Bharat')
    @dealer = Dealer.new('Dealer')
  end

  def start
    loop do
      deal_cards
      show_initial_cards
      player_turn
      break if player.busted?
      dealer_turn
      break if dealer.busted? || @dealer_turn == 's'
    end
    show_result
  end

  def deal_cards
    dealer.deal(player, deck)
  end

  def show_initial_cards
    puts "Dealer has #{dealer.cards[0][1]} and ?"
    puts "You have #{player.cards[0][1]} and #{player.cards[1][1]}"
  end

  def player_turn
    loop do
      puts "Your cards have a sum of #{player.total}"
      player_move_choice

      if @player_turn == 'h'
        player.hit(deck)
      end

      p player.cards
      break if player.busted? || @player_turn == 's'
    end

    show_player_message
  end

  def show_player_message
    if player.busted?
      puts "Oops. You busted!"
    else
      puts "You stayed at #{player.total}."
    end
  end

  def player_move_choice
    puts "Would you rather (h)it or (s)tay?"

    loop do
      @player_turn = gets.chomp.downcase
      break if %(h s).include?(@player_turn)
      puts "Sorry you must enter 'h' or 's'."
    end
  end

  def dealer_turn
    loop do
      break if dealer.total >= 17

      puts "Dealer hits!"
      dealer.hit(deck)
      puts "Dealers cards are now #{dealer.cards}"
    end

    if dealer.busted?
      puts "Dealer busted!"
    else
      @dealer_turn = 's'
      puts "Dealer stayed at #{dealer.total}"
    end
  end

  def show_result
    player_total = player.total
    dealer_total = dealer.total
    if player.busted?
      puts "You busted. Dealer wins."
    elsif dealer.busted?
      puts "Dealer busted. You win."
    elsif player_total > dealer_total
      puts "You won."
    elsif dealer_total > player_total
      puts "Dealer won."
    end
  end
end

Game.new.start
