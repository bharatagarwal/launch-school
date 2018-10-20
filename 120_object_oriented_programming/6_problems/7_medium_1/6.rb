# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

class GuessingGame
  GUESSES_PER_GAME  = 7

  def play
    system 'clear'
    @number = rand(1...100)
    remaining_attempts = GUESSES_PER_GAME

    loop do
      puts '' if remaining_attempts != GUESSES_PER_GAME
      puts "You have #{remaining_attempts} guesses remaining."

      receive_number
      @comparison = compare_value
      display_result

      break if @comparison == :equal
      
      remaining_attempts -= 1
      if remaining_attempts == 0
        display_loss_message
        break
      end

    end
  end

  private

  def receive_number
    loop do
      print "Enter a number between 1 and 100: "
      @entry = gets.chomp.to_i
      break if (1...100).include?(@entry)
      print "Invalid guess. "
    end
  end

  def compare_value
    if @entry > @number
      :higher
    elsif @entry < @number
      :lower
    elsif @entry == @number
      :equal
    end
  end

  def display_result
    case @comparison
    when :equal then puts "You won!"
    when :lower then puts "Your guess is too low."
    when :higher then puts "Your guess is too high."
    end
  end

  def display_loss_message
    puts ''
    puts "You are out of guesses. You lose!"
    puts "The number was #{@number}."
  end
end

  game = GuessingGame.new
  game.play

  # You have 7 guesses remaining.
  # Enter a number between 1 and 100: 104
  # Invalid guess. Enter a number between 1 and 100: 50
  # Your guess is too low

  # You have 6 guesses remaining.
  # Enter a number between 1 and 100: 75
  # Your guess is too low

  # You have 5 guesses remaining.
  # Enter a number between 1 and 100: 85
  # Your guess is too high

  # You have 4 guesses remaining.
  # Enter a number between 1 and 100: 0
  # Invalid guess. Enter a number between 1 and 100: 80

  # You have 3 guesses remaining.
  # Enter a number between 1 and 100: 81
  # You win!

  # game.play

  # You have 7 guesses remaining.
  # Enter a number between 1 and 100: 50
  # Your guess is too high

  # You have 6 guesses remaining.
  # Enter a number between 1 and 100: 25
  # Your guess is too low

  # You have 5 guesses remaining.
  # Enter a number between 1 and 100: 37
  # Your guess is too high

  # You have 4 guesses remaining.
  # Enter a number between 1 and 100: 31
  # Your guess is too low

  # You have 3 guesses remaining.
  # Enter a number between 1 and 100: 34
  # Your guess is too high

  # You have 2 guesses remaining.
  # Enter a number between 1 and 100: 32
  # Your guess is too low

  # You have 1 guesses remaining.
  # Enter a number between 1 and 100: 32
  # Your guess is too low
  # You are out of guesses. You lose.
