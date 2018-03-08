puts "Enter number of starting bottles: "
starting_bottles = gets.chomp.to_i

def s_check number
  if number >= 2
    return 's'
  elsif number == 1
    return ''
  else
    return 'You can\'t have s-es for zero or negative numbers!'
  end
end  


def print_bottle bottles
  
  original_number = bottles

  while bottles > 1  
    puts bottles.to_s + " bottle" + s_check(bottles) + " of beer on the wall, " + bottles.to_s + " bottle" + s_check(bottles) + " of beer."
    bottles -= 1
    puts "Take one down and pass it around, " + bottles.to_s + " bottle" + s_check(bottles) + " of beer on the wall."
  end

  puts "1 bottle of beer on the wall, 1 bottle of beer."
  puts "Take one down and pass it around, no more bottles of beer on the wall."
  puts "No more bottles of beer on the wall, no more bottles of beer. "
  puts "Go to the store and buy some more, " + original_number.to_s + " bottles of beer on the wall."

end

print_bottle starting_bottles