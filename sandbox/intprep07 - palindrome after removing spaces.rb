# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

ALPHANUMERIC = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a

def real_palindrome?(string)
  # stripped_string = string.downcase.chars.select do |char|
  #                     ALPHANUMERIC.include?(char)
  #                   end.join('')
  # stripped_string = string.downcase.delete('^a-z0-9')
  stripped_string = string.downcase.gsub(/[^a-z0-9]/, '')
  stripped_string == stripped_string.reverse
end

p real_palindrome?('madam  !') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false