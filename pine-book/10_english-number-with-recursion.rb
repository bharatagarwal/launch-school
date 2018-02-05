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

  num_string

end

puts english_number 3211
