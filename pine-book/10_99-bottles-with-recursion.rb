def english_number number
  if number < 0 # no negative numbers
    return 'Please enter a number that isn\'t negative'
  end

  if number == 0
    return 'zero'
  end

  num_string = ''

  ones_place = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  tens_place = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  teenagers = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']


  left = number

  write = left / 1000000000          # how many billions left?
  left = left - write * 1000000000   # subtracting off those billions

  if write > 0
    hundreds = english_number write
    num_string += hundreds + ' billion'

    if left > 0
      num_string += ' ' # so that you don't write two billionfifty-one
    end
  end

 

  write = left / 1000000          # how many millions left?
  left = left - write * 1000000   # subtracting off those millions

  if write > 0
    hundreds = english_number write
    num_string += hundreds + ' million'

    if left > 0
      num_string += ' ' # so that you don't write two millionfifty-one
    end
  end


  write = left / 1000          # how many thousands left?
  left = left - write * 1000   # subtracting off those thousands

  if write > 0
    hundreds = english_number write
    num_string += hundreds + ' thousand'

    if left > 0
      num_string += ' ' # so that you don't write two thousandfifty-one
    end
  end

  write = left / 100          # how many hundreds left?
  left = left - write * 100   # subtracting off those hundreds

  if write > 0
    hundreds = english_number write
    num_string += hundreds + ' hundred'

    if left > 0
      num_string += ' ' # so that you don't write two hundredfifty-one
    end
  end

  write = left / 10
  left = left - write * 10

  if write > 0
    if write == 1 && left > 0
      num_string += teenagers [left - 1] # left-1 to correspond with array
      left = 0
    else
      num_string += tens_place [write - 1]
    end 

    if left > 0
      num_string += '-' # sixty-four, rather than sixtyfour
    end
  end

  write = left
  left = 0

  if write > 0
    num_string += ones_place [write - 1]
  end

  num_string[0] = num_string[0].upcase
  num_string

end

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
    puts english_number(bottles) + " bottle" + s_check(bottles) + " of beer on the wall, " + english_number(bottles)+ " bottle" + s_check(bottles) + " of beer."
    bottles -= 1
    puts "Take one down and pass it around, " + english_number(bottles) + " bottle" + s_check(bottles) + " of beer on the wall."
  end

  puts "one bottle of beer on the wall, one bottle of beer."
  puts "Take one down and pass it around, no more bottles of beer on the wall."
  puts "No more bottles of beer on the wall, no more bottles of beer. "
  puts "Go to the store and buy some more, " + english_number(original_number) + " bottles of beer on the wall."

end

print_bottle starting_bottles