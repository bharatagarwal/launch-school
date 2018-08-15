class Move
  VALUES = %w[rock paper scissors lizard spock]

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

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def to_s
    @value
  end
end

class Rock < Move
  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.paper? || other_move.spock?
  end
end

class Paper < Move
  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.lizard? || other_move.scissors?
  end
end

class Scissors < Move
  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.rock? || other_move.spock?
  end
end

class Lizard < Move
  def >(other_move)
    other_move.paper? || other_move.spock?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end
end

class Spock < Move
  def >(other_move)
    other_move.rock? || other_move.scissors?
  end

  def <(other_move)
    other_move.paper? || other_move.lizard?
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    self.score = 0
  end

  def choose(choice)
    case choice
    when 'rock' then self.move = Rock.new(choice)
    when 'paper' then self.move = Paper.new(choice)
    when 'scissors' then self.move = Scissors.new(choice)
    when 'lizard' then self.move = Lizard.new(choice)
    when 'spock' then self.move = Spock.new(choice)
    end
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
      puts "Please choose #{Move::VALUES.join(', ')}:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end

    super(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'HAL 9000'].sample
  end

  def choose
    choice = Move::VALUES.sample
    super(choice)
  end
end

# Game Orchestration Engine
class RPSGame
  MAX_SCORE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to #{Move::VALUES.join(', ')}!"
  end

  def display_score
    puts "#{human.name} has score: #{human.score}"
    puts "#{computer.name} has score: #{computer.score}"
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::VALUES.join(', ')}. Goodbye!"
  end

  def display_choices
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
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

  def max_reached?
    human.score == MAX_SCORE || computer.score == MAX_SCORE
  end

  def display_overall_winner
    if human.score == MAX_SCORE
      winner = human.name
    elsif computer.score == MAX_SCORE
      winner = computer.name
    end

    puts "#{winner} has won the match by reaching #{MAX_SCORE} wins."
  end

  def play
    display_welcome_message

    loop do
      system('clear') || system('cls')
      display_score
      human.choose
      computer.choose
      display_choices
      display_winner
      update_score
      display_overall_winner if max_reached?
      break if max_reached?
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
