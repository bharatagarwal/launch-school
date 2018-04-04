VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_SHORTENED = %w(r p x l s)

score = {
  player: 0,
  computer: 0
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  if first == 'rock'
    (second == 'lizard' || second == 'scissors')
  elsif first == 'paper'
    (second == 'rock' || second == 'spock')
  elsif first == 'scissors'
    (second == 'paper' || second == 'lizard')
  elsif first == 'lizard'
    (second == 'spock' || second == 'paper')
  elsif first == 'spock'
    (second == 'rock' || second == 'scissors')
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def compute_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

grand_winner = nil

loop do
  print %x(`clear`)
  puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  puts "First person to reach 5 wins is the grand winner."
  puts "The scores are: "
  puts "Player: #{score[:player]} Computer: #{score[:computer]}"

  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Shortened: #{VALID_SHORTENED.join(',      ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_SHORTENED.include?(choice)
      choice = VALID_CHOICES[VALID_SHORTENED.find_index(choice)]
      break
    else
      prompt("That's not a valid choice.")
    end=
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  compute_score(choice, computer_choice, score)

  grand_winner = if score[:player] == 5
                   'You are'
                 elsif score[:computer] == 5
                   'The computer is'
                 end

  if grand_winner.nil?
    puts "Press any key to proceed"
    gets
  end

  break if score[:player] == 5 || score[:computer] == 5
end

prompt("Thank you for playing. #{grand_winner} the Grand Winner!")
