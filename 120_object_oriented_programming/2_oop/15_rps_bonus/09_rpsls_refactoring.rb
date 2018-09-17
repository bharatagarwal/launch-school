require "pry"

module WeightedRandomness
  def update_choice_distribution(opponent_dominant_move, difference)

    all_moves = Move::VALUES.clone
    other_moves = all_moves.delete(opponent_dominant_move)

    if difference > 0
      subtract_from_dominant_move(opponent_dominant_move, difference)
      add_to_other_moves(other_moves, difference)
    end
  end

  def subtract_from_dominant_move(opponent_dominant_move, difference)
    amount = difference / (Move::NUMBER_OF_MOVE_OPTIONS - 1)
    if @choice_distribution[opponent_dominant_move] - amount >= 0
      @choice_distribution[opponent_dominant_move] -= amount
    end
  end

  def add_to_other_moves(other_moves, difference)
    amount = difference / (Move::NUMBER_OF_MOVE_OPTIONS - 1)**2
    if other_moves.reduce(0) { |sum, move| @choice_distribution[move] + amount } <= 100
      other_moves.each do |move|
        @choice_distribution[move] += amount
      end
    end
  end

  def create_new_choice_set
    choice_set = []

    @choice_distribution.each do |choice, value|
      value.to_i.times do
        choice_set << choice
      end
    end

    choice_set
  end

  def choose_from_weighted_distribution
    create_new_choice_set.sample
  end

end

class Move
  attr_reader :value
  VALUES = [:rock, :paper, :scissors, :lizard, :spock]
  NUMBER_OF_MOVE_OPTIONS = VALUES.size

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

class History
  attr_accessor :game, :move

  def initialize
    @game = { choice: [], result: [] }
    initiate_move_hash
  end

  def update_win_percentages
    match_length = game[:result].size
    Move::VALUES.each do |mv| 
      @move[mv][:win_percentage] = move[mv][:wins] * 100.to_f / match_length
    end
  end
    
  def dominant_move
    dominator_percentage = 0
    Move::VALUES.reduce(nil) do |dominator, mv|
      if @move[mv][:win_percentage] >= dominator_percentage
        dominator_percentage = @move[mv][:win_percentage]
        mv
      else
        dominator
      end
    end
  end

  private

  def initiate_move_hash
    @move = {}

    Move::VALUES.each do |mv|
      @move[mv] = { wins: 0, win_percentage: 0}
    end
  end

end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    @score = 0
    @game_record = { choice: [], result: [] }
    @history = History.new
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
    history.game[:choice] << move.value
  end

  def display_choice
    puts "#{name} chose: #{move.value}"
  end

  def record_result(other_player) #other player's move
    if move > other_player.move
      history.game[:result] << :won
      self.score += 1
      history.move[other_player.move.value][:wins] += 1
    elsif move < other_player.move
      history.game[:result] << :lost
    else
      history.game[:result] << :draw
    end

    history.update_win_percentages
  end

  def display_result(other_player) #other player's name
    if history.game[:result].last == :won
      puts "#{name} won!"
    elsif history.game[:result].last == :lost
      puts "#{other_player.name} won!"
    else
      puts "It's a tie!"
    end
  end
end

class Human < Player
  VALUES_SHORTHAND = {r: :rock,
                      p: :paper,
                      x: :scissors,
                      l: :lizard,
                      s: :spock}

  def initialize
    set_name
    super
  end

  def set_name
    n = nil

    loop do
      puts "What's your name?"  
      n = gets.chomp
      break unless n.empty? || n.squeeze == ''
      puts "Sorry, you must enter a value."
    end

    self.name = n
  end

  def choose
    choice = nil

    loop do
      puts "Please choose #{Move::VALUES.join(', ')}:"
      display_shorthand_options
      choice = gets.chomp.downcase.to_sym
      if shorthand_entry?(choice)
        choice = translate_shorthand(choice)
      end
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end

    super(choice)
  end

  private

  def display_shorthand_options
    index = 0
    padded_shorthand = Move::VALUES.map do |val|
                         length = val.length
                         corresponding_shorthand = "(#{VALUES_SHORTHAND.keys[index].to_s})"
                         index += 1
                         corresponding_shorthand.center(length)
                       end
    padded_shorthand.last.rstrip!
    puts "Or for short  #{padded_shorthand.join('  ')}:"

  end

  def shorthand_entry?(choice)
    VALUES_SHORTHAND.keys.include?(choice)
  end

  def translate_shorthand(choice)
    VALUES_SHORTHAND[choice]
  end
end

class Computer < Player
  include WeightedRandomness

  WIN_PERCENTAGE_THRESHOLD = 0
  DATA_HEADSTART_LENGTH = 3
  MODELS = ['HAL 9000', 'R2D2', 'Deep Thought']

  def initialize
    create_evenly_distributed_choice_set
    super
  end

  def choose_based_on(other_player, opponent_dominant_move)
    difference_in_win_percentage = history.move[opponent_dominant_move][:win_percentage] - other_player.history.move[opponent_dominant_move][:win_percentage]

    update_choice_distribution(opponent_dominant_move, difference_in_win_percentage)
    choose_from_weighted_distribution
  end

  def choose_randomly
    Move::VALUES.sample
  end

  def choose(other_player, choice=nil)
    return super(choice) if choice

    opponent_dominant_move = other_player.history.dominant_move
    # binding.pry

    if threshold_condition_met?(other_player, opponent_dominant_move)
      puts 'Beyond threshold!'
      super(choose_based_on(other_player, opponent_dominant_move))
    else
      puts 'choosing randomly'
      super(choose_randomly)
    end
  end

  private

  def create_evenly_distributed_choice_set
    @choice_distribution = {}

    Move::VALUES.each do |val|
      @choice_distribution[val] = 100 / Move::NUMBER_OF_MOVE_OPTIONS
    end
  end

  def threshold_condition_met?(other_player, opponent_dominant_move)
    match_length = history.game[:result].size

    other_player.history.move[opponent_dominant_move][:win_percentage] >=
    WIN_PERCENTAGE_THRESHOLD && match_length > DATA_HEADSTART_LENGTH
  end
end

class Hal < Computer
  attr_reader :personality

  def initialize
    @name = 'HAL 9000'
    @personality = "HAL likes scissors like a pyscho!"
    super
  end

  def choose(other)

    @choice_distribution = { rock: 10, paper: 2, scissors: 72,
                             lizard: 8, spock: 8 }

    choice_set = create_choice_set

    choice = choice_set.sample
    super(other, choice)
  end
end

class R2D2 < Computer
  attr_reader :personality

  def initialize
    @name = 'R2D2'
    @personality = "R2D2 has an affinity for the rocks of Tattooine."
    super
  end

  def choose(other)
    @choice_distribution = { rock: 90, paper: 2, scissors: 2,
                             lizard: 2, spock: 2 }

    choice_set = create_choice_set

    choice = choice_set.sample
    super(other, choice)
  end
end

class DeepThought < Computer
  attr_reader :personality

  def initialize
    @name = 'Deep Thought'
    @personality = "Deep Thought analyses and chooses smartly."
    super
  end

  def choose(other)
    super(other)
  end
end

# Game Orchestration Engine
class RPSLSGame
  MAX_SCORE = 7

  attr_reader :human, :computer

  def initialize
    system 'clear'
    display_welcome_message
    @human = Human.new

    @computer = case choose_computer_model
                when 1 then Hal.new
                when 2 then R2D2.new
                when 3 then DeepThought.new
                end
  end

  def choose_computer_model
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

    model
  end

  def display_welcome_message
    puts "Welcome to #{Move::VALUES.map(&:to_s).map(&:capitalize).join(', ')}!"
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

  def display_scores
    human.display_score
    computer.display_score
    puts computer.personality
  end

  def make_choices
    human.choose
    computer.choose(human)
  end

  def record_choices
    human.record_choice
    computer.record_choice
  end

  def display_choices
    human.display_choice
    computer.display_choice
  end

  def record_results
    human.record_result(computer)
    computer.record_result(human)
  end

  def display_result
    human.display_result(computer)
  end

  def play

    loop do
      system('clear')

      display_scores
      make_choices
      record_choices
      display_choices
      record_results
      display_result

      display_overall_winner if max_reached?
      break if max_reached? || !play_again?
    end

    display_goodbye_message
  end
end

RPSLSGame.new.play
