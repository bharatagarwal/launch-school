# Move
# inheritance:
# responsibilities:
# has a value
# checks whether value is rock, paper or scissor
# compares value of individual moves
# does string interpolation
# collaborators: (showing how messages are sent)

# Player
# inheritance: superclass to Human and Computer.
# responsibilities:
# has a name and a move choice
# initialise player name setting process
# collaborators: Move(thru inheritance?)

# Human
# inheritance: subclass of Player.
# responsibilities:
# sets name
# chooses move
# collaborators: Move

# Computer
# inheritance: subclass of Player
# responsibilities:
# has a name and a move choice
# chooses name
# chooses a move
# collaborators: Move

# RPSGame
# inheritance: none
# responsibilities:
# has a human and computer player
# display welcome message
# display choices
# check whether player wants to play again
# display goodbye message
# collaborators: Player, Human

class Move
  VALUES = %w[rock paper scissors]

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      paper? && other_move.rock? ||
      scissors? && other_move.paper?
  end

  def <(other_move)
    rock? && other_move.paper? ||
      paper? && other_move.scissors? ||
      scissors? && other_move.rock?
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil

    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value."
    end

    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'HAL 9000'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_choices
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
    return false if answer == 'n'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_choices
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
