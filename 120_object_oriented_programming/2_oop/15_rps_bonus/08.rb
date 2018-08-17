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
    @score = 0
    @game_record = { choice: [], result: [] }
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
    puts "#{name} has score: #{score}"
  end

  def record_choice
    game_record[:choice] << move.to_s
  end

  def display_choice
    puts "#{name} chose: #{move}"
  end

  def record_result(other)
    if move > other.move
      game_record[:result] << :won
      # other.game_record[:result] << :lost
      self.score += 1
    elsif move < other.move
      game_record[:result] << :lost
      # other.game_record[:result] << :won
    else
      game_record[:result] << :draw
      # other.game_record[:result] << :draw
    end
  end

  def display_result(other)
    if game_record[:result].last == :won
      puts "#{name} won!"
    elsif game_record[:result].last == :lost
      puts "#{other.name} won!"
    else
      puts "It's a tie!"
    end
  end
end

class Human < Player
  def initialize
    set_name
    super
  end

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
  attr_accessor :opponent_win_percentage, :opponent_win_count, :current_choice_percentages

  def initialize
    super
    @opponent_win_count = { 'rock' => 0, 'paper' => 0, 'scissors' => 0,
                            'lizard' => 0, 'spock' => 0 }
    @opponent_win_percentage = { 'rock' => 0, 'paper' => 0, 'scissors' => 0,
                                 'lizard' => 0, 'spock' => 0 }

    @current_choice_percentages = { rock: 20, paper: 20, scissors: 20,
                                    lizard: 20, spock: 20 }
  end

  def compute_loss_count
    if @game_record[:result].last == :lost
      @opponent_win_count[@game_record[:choice].last] += 1
    end

    @no_of_turns = game_record[:result].size

    @opponent_win_count.each do |k, _|
      @opponent_win_percentage[k] = (@opponent_win_count[k].to_f * 100 /
                                     @no_of_turns).round(0)
    end
  end

end

class Hal < Computer
  attr_accessor :name

  def initialize
    self.name = 'HAL 9000'
    super
  end

  def choose
    choice_percentages = { rock: 10, paper: 2, scissors: 72,
                                    lizard: 8, spock: 8 }

    choice_set = []
    choice_percentages.each do |chc, value|
      value.times do
        choice_set << chc.to_s
      end
    end

    puts "HAL 9000 loves scissors for some reason."
    choice = choice_set.sample
    super(choice)
  end
end

class R2D2 < Computer

  attr_accessor :name

  def initialize
    self.name = 'R2D2'
    super
  end
  def choose
    choice_percentages = { rock: 90, paper: 2, scissors: 2,
                                    lizard: 2, spock: 2 }

    choice_set = []
    choice_percentages.each do |chc, value|
      value.times do
        choice_set << chc.to_s
      end
    end

    puts "R2D2 has a thing for rocks."
    choice = choice_set.sample
    super(choice)
  end

end

class Chappie < Computer

  attr_accessor :name

  def initialize
    self.name = 'Chappie'
    super
  end

  def choose
    choice_percentages = { rock: 0, paper: 92, scissors: 4,
                                    lizard: 2, spock: 2 }

    choice_set = []
    choice_percentages.each do |chc, value|
      value.times do
        choice_set << chc.to_s
      end
    end

    puts "Chappie's a paper pusher."
    choice = choice_set.sample
    super(choice)
  end
end

# Game Orchestration Engine
class RPSLSGame
  MAX_SCORE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    
    comp = ['R2D2', 'HAL 9000', 'Chappie'].sample

    case comp
    when 'R2D2' then @computer = R2D2.new
    when 'HAL 9000' then @computer = Hal.new
    when 'Chappie' then @computer = Chappie.new
    end
  end

  def display_welcome_message
    puts "Welcome to #{Move::VALUES.join(', ')}!"
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
      computer.record_result(human)

      human.display_result(computer)
      computer.compute_loss_count
      display_overall_winner if max_reached?
      break if max_reached? || !play_again?
    end

    display_goodbye_message
  end
end

RPSLSGame.new.play
