def ask_recursively question
  puts question
  reply = gets.chomp.downcase

  if reply == 'yes'
    true
  elsif reply == 'no'
    false
  else
    puts "Please answer 'yes' or 'no'."
    ask_recursively question
  end
end

puts "So, it's " + (ask_recursively 'Do you wet the bed?').to_s + "!"