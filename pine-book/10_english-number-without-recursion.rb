def english_number number
  # We accept numbers from 0 to 100
  if number < 0
    return 'Please enter a number 0 or greater'
  end

  if number > 100
    return 'Please enter a number less than 100'
  end


  num_string = ''

  left = number             # how much of the number left to write
  write = left/100          # part we are writing now; number of hundreds
  left = left - write * 100   # subtracting off those hundreds

  if write > 0
    return 'one hundred'
  end

  write = left/10
  left = left - write * 10

  if write > 0
    if write == 1 # can't write tenty two, so there's a difference here
      if left == 0 
        num_string += 'ten'
      elsif left == 1
        num_string+= 'eleven'  
      elsif left == 2
        num_string+= 'twelve'
      elsif left == 3
        num_string+= 'thirteen'
      elsif left == 4
        num_string+= 'fourteen'
      elsif left == 5
        num_string+= 'fifteen'
      elsif left == 6
        num_string+= 'sixteen'
      elsif left == 7
        num_string+= 'seventeen'  
      elsif left == 8
        num_string+= 'eighteen'  
      elsif left == 9
        num_string+= 'nineteen'  
      end

      left = 0

    elsif write == 2
      num_string+= 'twenty'
    elsif write == 3
      num_string+= 'thirty'
    elsif write == 4
      num_string+= 'forty'
    elsif write == 5
      num_string+= 'fifty'
    elsif write == 6
      num_string+= 'sixty'
    elsif write == 7
      num_string+= 'seventy'
    elsif write == 8
      num_string+= 'eighty'
    elsif write == 9
      num_string+= 'ninety'
    end

    if left > 0
      num_string+= '-'
    end
  end

  write = left  # ones left to write out
  left = 0      # subtract off the ones

  if write > 0
    if write == 1
      num_string += 'one'
    elsif write == 2 
      num_string += 'two'
    elsif write == 3
      num_string += 'three'
    elsif write == 4
      num_string += 'four'
    elsif write == 5
      num_string += 'five'
    elsif write == 6
      num_string += 'six'      
    elsif write == 7
      num_string += 'seven'
    elsif write == 8
      num_string += 'eight'
    elsif write == 9 
      num_string += 'nine'
    end
  end
  
  if num_string == '' #only way for numstring to be empty is for number to be zero
    return 'zero'
  end

  num_string

end

puts english_number 77
puts english_number 0
puts english_number 11
puts english_number 31
puts english_number 68
puts english_number 91
puts english_number 44
puts english_number 7

