require 'pry'

class Move
  VALUES = [:rock, :paper, :scissors, :lizard, :spock]
  NUMBER_OF_MOVE_OPTIONS = VALUES.size
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

  def to_sym
    @value.to_sym
  end
end

class Rock < Move
  def initialize
    @value = :rock
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
    @value = :paper
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
    @value = :scissors
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
    @value = :lizard
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
    @value = :spock
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
    when :rock then self.move = Rock.new
    when :paper then self.move = Paper.new
    when :scissors then self.move = Scissors.new
    when :lizard then self.move = Lizard.new
    when :spock then self.move = Spock.new
    end
  end

  def display_score
    puts "#{name} has score: #{score}"
  end

  def record_choice
    game_record[:choice] << move.to_sym
  end

  def display_choice
    puts "#{name} chose: #{move.to_sym}"
  end

  def record_result(other)
    if move > other.move
      game_record[:result] << :won
      self.score += 1
    elsif move < other.move
      game_record[:result] << :lost
    else
      game_record[:result] << :draw
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
  attr_accessor :move_win_history

  def initialize
    super
    @move_win_history = {}
    Move::VALUES.each do |val|
      @move_win_history[val.to_sym] = { wins: 0,
                                        win_percentage: 0 }
    end
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
      choice = gets.chomp.downcase.to_sym
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end

    super(choice)
  end

  def record_result(other)
    super
    if move > other.move
      update_move_wins
    end

    update_move_win_percentages
  end

  def update_move_wins
    move_made = game_record[:choice].last
    current_move_history = move_win_history[move_made]
    current_move_history[:wins] += 1
  end

  def update_move_win_percentages
    move_made = game_record[:choice].last
    current_move_history = move_win_history[move_made]
    match_length = game_record[:result].size

    current_move_history[:win_percentage] =
      (current_move_history[:wins] * 100 / match_length.to_f).round(0)
  end

  def dominant_move
    dominator = nil
    dominator_win_percentage = 0

    move_win_history.each do |move, history|
      if history[:win_percentage] > dominator_win_percentage
        dominator = move
        dominator_win_percentage = history[:win_percentage]
      end
    end

    dominator
  end
end

class Computer < Player
  WIN_PERCENTAGE_THRESHOLD = 0
  DATA_GATHERING_LIMIT = 3
  MODELS = ['HAL 9000', 'R2D2', 'Deep Thought']

  def initialize
    @choice_percentages = {}

    Move::VALUES.each do |val|
      @choice_percentages[val] = 100 / Move::NUMBER_OF_MOVE_OPTIONS
    end
    super
  end

  def set_name
    self.name = ['R2D2', 'HAL 9000', 'Deep Thought'].sample
  end

  def update_choice_percentages(addition_value, subtraction_value)
    @choice_percentages.each do |chc, _|
      subtracted_percentage_value = @choice_percentages[chc] -
                                    subtraction_value

      sum_of_percentage_values = @choice_percentages.values.reduce(:+)

      if chc == @dominator &&  subtracted_percentage_value > 0
        @choice_percentages[chc] -= subtraction_value
      elsif sum_of_percentage_values <= 100
        @choice_percentages[chc] += addition_value
      end
    end
  end

  def create_choice_set
    choice_set = []

    @choice_percentages.each do |chc, value|
      value.times do
        choice_set << chc
      end
    end

    choice_set
  end

  def choose_smartly
    difference_in_percentages = @dominator_win_percentage -
                                @choice_percentages[@dominator]

    subtraction_value = difference_in_percentages /
                        (Move::NUMBER_OF_MOVE_OPTIONS - 1)
    addition_value = subtraction_value / (Move::NUMBER_OF_MOVE_OPTIONS - 1)

    update_choice_percentages(addition_value, subtraction_value)

    choice_set = create_choice_set
    puts "choosing less randomly!"
    choice_set.sample
  end

  def choose_randomly
    puts "Choosing randomly."
    choice = Move::VALUES.sample

    choice
  end

  def choose(other_player, choice=nil)
    return super(choice) if choice

    match_length = game_record[:result].size

    if match_length > DATA_GATHERING_LIMIT
      @dominator = other_player.dominant_move
      @dominator_win_percentage =
        other_player.move_win_history[@dominator][:win_percentage]

      choice = if @dominator_win_percentage > WIN_PERCENTAGE_THRESHOLD
                 choose_smartly
               else
                 choice = choose_randomly
               end
    else
      choice = choose_randomly
    end

    super(choice)
  end
end

class Hal < Computer
  def initialize
    @name = 'HAL 9000'
    super
  end

  def choose(other)
    puts "HAL likes scissors like a pyscho!"
    choice_percentages = { rock: 10, paper: 2, scissors: 72,
                           lizard: 8, spock: 8 }

    choice_set = []
    choice_percentages.each do |chc, value|
      value.times do
        choice_set << chc
      end
    end

    puts "HAL 9000 loves scissors for some reason."
    choice = choice_set.sample
    super(other, choice)
  end
end

class R2D2 < Computer
  def initialize
    @name = 'R2D2'
    super
  end

  def choose(other)
    puts "R2D2 has an affinity for the rocks of Tattooine."
    choice_percentages = { rock: 90, paper: 2, scissors: 2,
                           lizard: 2, spock: 2 }

    choice_set = []
    choice_percentages.each do |chc, value|
      value.times do
        choice_set << chc
      end
    end

    choice = choice_set.sample
    super(other, choice)
  end
end

class DeepThought < Computer
  def initialize
    @name = 'Deep Thought'
    super
  end

  def choose(other)
    puts "Deep Thought analyses and chooses smartly."
    super
  end
end

# Game Orchestration Engine
class RPSLSGame
  MAX_SCORE = 9

  def initialize
    @human = Human.new

    puts "Do you want to play as: "
    Computer::MODELS.each_with_index do |model, index|
      puts "#{index + 1}. #{model}"
    end
    
    model = ''
    loop do
      puts "Enter a number: "
      model = gets.chomp.to_i
      break if [1, 2, 3].include?(model)
      puts "Please enter a number between 1 and 3 to choose the model."
    end

    @computer = case model
                when 1 then Hal.new
                when 2 then R2D2.new
                when 3 then DeepThought.new
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
    @human.score == MAX_SCORE || @computer.score == MAX_SCORE
  end

  def display_overall_winner
    if @human.score == MAX_SCORE
      winner = @human.name
    elsif @computer.score == MAX_SCORE
      winner = @computer.name
    end

    puts "#{winner} has won the match by reaching #{MAX_SCORE} wins."
  end

  def display_scores
    @human.display_score
    @computer.display_score
  end

  def make_choices
    @human.choose
    @computer.choose(@human)
  end

  def record_choices
    @human.record_choice
    @computer.record_choice
  end

  def display_choices
    @human.display_choice
    @computer.display_choice
  end

  def record_results
    @human.record_result(@computer)
    @computer.record_result(@human)
  end

  def play
    display_welcome_message

    loop do
      system('clear')

      display_scores
      make_choices
      record_choices
      display_choices
      record_results
      @human.display_result(@computer)

      display_overall_winner if max_reached?
      break if max_reached? || !play_again?
    end

    display_goodbye_message
  end
end

RPSLSGame.new.play
