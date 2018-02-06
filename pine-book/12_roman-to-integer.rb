# convert number to modern school roman numeral
# checking for roman validity via
# invalid characters, invalid doubling of characters like 'V'
# correct order of elements (to be done), and avoiding four instances
# of correctly placed alphabets.

conversion_table = [
  [1, 'I'], #repeatable 
  [4, 'IV'],
  [5, 'V'],
  [9, 'IX'],
  [10, 'X'], #repeatable
  [40, 'XL'],
  [50, 'L'], 
  [90, 'XC'],
  [100, 'C'], #repeatable
  [400, 'CD'],
  [500, 'D'], 
  [900, 'CM'],
  [1000,'M'] #repeatable
]



puts "Enter roman numeral: "
roman_numeral = gets.chomp

def invalid_double letter
  repeatable_romans = ['I', 'X', 'C', 'M']
  flag = 0
  
  repeatable_romans.each do |r|
    if r == letter
      return false
    end
  end

  return true
end


def invalid_repetitions string

  last_index = string.length-1 
  counter = 1
  repeated = ''

  while last_index > 0
    if string[last_index] == string[last_index-1]
      counter+=1
      repeated = string[last_index]  
    end
      
    last_index-= 1

    if counter > 1 && (invalid_double(repeated) == true)
      return true
    end

  end

  if counter > 3
    return true
  else  
    return false
  end
  
end

def invalid_characters string, table
  flag = 0

  string = string.split("")
  characters = []

  table.each do |pair|
    characters.push(pair[1])
  end

  string.each do |s|
    if characters.include?(s) == false
      return true
    end
  end
  
  false  
end

def wrong_order string, table
  return false
end

def roman_valid string, table
  if (invalid_characters(string, table) == false) && (invalid_repetitions(string) == false)
   # && wrong_order(string, table) == false
    true
  else
    false
  end
end

def roman_to_integer (roman, table)

  integer = 0
  index = 0

  while roman.length > 0

    # Adjusting for length of roman numeral
    subnumeral_length = table[index][1].length

    while roman[-subnumeral_length..-1] == table[index][1]
      
      # adding up integer
      integer+= table[index][0]

      # removing roman numeral added up
      roman[-subnumeral_length..-1] = '' 
    end

    index+= 1
  end

  return integer
end

puts "Integer: "
if (roman_valid(roman_numeral, conversion_table) == true)
  puts roman_to_integer(roman_numeral, conversion_table)
else
  puts "Invalid roman numeral"
end

