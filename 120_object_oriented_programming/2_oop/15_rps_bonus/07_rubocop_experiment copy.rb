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
  attr_accessor :opponent_win_percentage, :opponent_win_count

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

  def set_name
    self.name = ['R2D2', 'HAL 9000', 'Chappie'].sample
  end

  def choose
    choice = '' # a 1

    if @opponent_win_percentage.values.max > 40 &&
       @no_of_turns > 3 # c 1 2
      dominator = @opponent_win_percentage.key(opponent_win_percentage.values.max).to_sym # a 2

      difference = @opponent_win_percentage.values.max -
                   @current_choice_percentages[dominator] # a 3

      subtraction_value = difference / 4 # a 4
      addition_value = subtraction_value / 4 # a 5

      @current_choice_percentages.each do |chc, _|
        if chc == dominator && (@current_choice_percentages[chc] - subtraction_value > 0) # c 3 4
          @current_choice_percentages[chc] -= subtraction_value # a 6
        elsif @current_choice_percentages.values.reduce(:+) <= 100 # c 5
          @current_choice_percentages[chc] += addition_value # a 7
        end
      end

      choice_set = [] # a 8
      @current_choice_percentages.each do |chc, value|
        value.times do
          choice_set << chc.to_s
        end
      end

      puts "choosing less randomly!"
      choice = choice_set.sample # a 9
    else
      choice = Move::VALUES.sample # a 10
    end

    super(choice)
  end
end

# Game Orchestration Engine
class RPSLSGame
  MAX_SCORE = 9
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
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

      human_player = human
      computer_player = computer

      human_player.display_score
      computer_player.display_score

      human_player.choose
      computer_player.choose

      human_player.record_choice
      computer_player.record_choice

      human_player.display_choice
      computer_player.display_choice

      human_player.record_result(computer_player)
      computer_player.record_result(human_player)

      human_player.display_result(computer_player)
      computer_player.compute_loss_count

      # result
      # choice
      # reduce method calls
      display_overall_winner if max_reached?
      break if max_reached? || !play_again?
    end

    display_goodbye_message
  end
end

RPSLSGame.new.play
