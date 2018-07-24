# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

def non_repeated(array)
  details = {
      0 => 0,
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0,
      6 => 0,
      7 => 0,
      8 => 0,
      9 => 0
    }

  array.each do |num|
    details[num] += 1
    return false if details[num] > 1
  end

  true
end

def featured(number)

  quotient, remainder = number.divmod(7)
  
  base_number = (quotient + 1) * 7

  loop do
    if base_number.odd? && non_repeated(base_number.digits)
      return base_number
    else
      base_number += 7
    end
  end

end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements