# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def letter_case_count(string)

  distribution = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    
    case ALPHABETS.include?(char)
    when true
      if char.downcase == char
        distribution[:lowercase] += 1
      elsif char.upcase == char
        distribution[:uppercase] += 1
      end
    when false
      distribution[:neither] += 1
    end
  end
    
  distribution
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }