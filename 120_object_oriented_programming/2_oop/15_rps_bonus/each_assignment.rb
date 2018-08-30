def current_choice_percentages
  values = 
  { rock: 20, paper: 20, scissors: 20,
    lizard: 20, spock: 20 }

  values.each do |chc, _|
    puts chc
  end
end

current_choice_percentages
