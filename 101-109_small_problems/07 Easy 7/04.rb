# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  string.chars.map do |char|
    if char.downcase == char
      char.upcase
    elsif char.upcase == char
      char.downcase
    else
      char
    end
  end.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# [23] pry(main)> string = 'Hell o!'
# => "Hell o!"
# [24] pry(main)> string.chars.map do { |char| char.upcase }.join('')
# [24] pry(main)*   
# [24] pry(main)> edit
# => "Hell o!"
# [25] pry(main)> string.chars.map { |char| char.upcase }.join('')
# => "HELL O!"
# [26] pry(main)> string.chars.map { |char| char.upcase! }.join('')
# => "ELLO"