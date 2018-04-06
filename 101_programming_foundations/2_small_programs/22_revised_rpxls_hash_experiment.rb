VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_LOOKUP = {
  'rock' => {
    'lizard' => true,
    'spock' => false,
    'scissors' => true,
    'paper' => false
  },
  'paper' => {
    'rock' => true,
    'lizard' => false,
    'spock' => true,
    'scissors' => false
  },
  'scissors' => {
    'paper' => true,
    'rock' => false,
    'lizard' => true,
    'spock' => false
  },
  'spock' => {
    'scissors' => true,
    'paper' => false,
    'rock' => true,
    'lizard' => false
  },
  'lizard' => {
    'spock' => true,
    'scissors' => false,
    'paper' => true,
    'rock' => false
  }
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

choice = ''
loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  choice = Kernel.gets().chomp()

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice.")
  end
end

computer_choice = VALID_CHOICES.sample()

Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

winning_message = if WIN_LOOKUP[choice][computer_choice]
                    'You won!'
                  elsif !WIN_LOOKUP[choice][computer_choice]
                    'Computer won!'
                  else
                    'It\'s a tie!'
                  end

puts winning_message
