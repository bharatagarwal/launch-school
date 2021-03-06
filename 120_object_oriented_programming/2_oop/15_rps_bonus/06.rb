# rock paper scissors lizard spock
# 1    2     3        4      5

# change from sample to a comp_choose method
# parse_history
# identify those with win percentage higher than 40%
# choice_percentage = 100/NUM_OF_FACTORS% by default
# if 2 of those, reduce two quantities by 10% and distribute the 2*10%
# between remaining quantities.

# choose as per new percentages.

# score and move can become linked.

class Move
  VALUES = %w[rock paper scissors lizard spock]
  @value = nil

  def scissors?
    false
  end

  def rock?
    false
  end

  def paper?
    false
  end

  def spock?
    false
  end

  def lizard?
    false
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
  end

  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.paper? || other_move.spock?
  end

  def rock?
    true
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end

  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.lizard? || other_move.scissors?
  end

  def paper?
    true
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end

  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.rock? || other_move.spock?
  end

  def scissors?
    true
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end

  def >(other_move)
    other_move.paper? || other_move.spock?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end

  def lizard?
    true
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
  end

  def >(other_move)
    other_move.rock? || other_move.scissors?
  end

  def <(other_move)
    other_move.paper? || other_move.lizard?
  end

  def spock?
    true
  end
end

class Player
  attr_accessor :move, :name, :score, :game_record

  def initialize
    set_name
    self.score = 0
    self.game_record = { choice: [], result: [] }
  end

  def choose(choice)
    case choice
    when 'rock' then self.move = Rock.new
    when 'paper' then self.move = Paper.new
    when 'scissors' then self.move = Scissors.new
    when 'lizard' then self.move = Lizard.new
    when 'spock' then self.move = Spock.new
    end
  end

  def display_score
    puts "#{self.name} has score: #{self.score}"
  end

  def record_choice
    self.game_record[:choice] << self.move.to_s
  end

  def display_choice
    puts "#{self.name} chose: #{self.move}"
  end

  def record_result(other)
    if self.move > other.move
     self.game_record[:result] << :won
     self.score += 1
    elsif self.move < other.move
      self.game_record[:result] << :lost
      other.score += 1
    else
      self.game_record[:result] << :draw
    end
  end

  def display_result(other)
    if self.game_record[:result].last == :won
      puts "#{self.name} won!"
    else
      puts "#{other.name} won!"
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
class RPSLSGame
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
      system('clear')
      human.display_score
      computer.display_score
      human.choose
      computer.choose
      human.record_choice
      computer.record_choice
      human.display_choice
      computer.display_choice
      human.record_result(computer)
      human.display_result(computer)
      display_overall_winner if max_reached?
      break if max_reached? || !play_again?
    end

    display_goodbye_message
  end
end

RPSLSGame.new.play
