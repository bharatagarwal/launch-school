# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

ALPHABETICAL = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  new_string = ''
  string.chars.each_with_index do |char, index|
    if ALPHABETICAL.include?(char)
      if (index + 1).odd?
        new_string << char.upcase
      else
        new_string << char.downcase
      end
    else
      new_string << char
    end
  end

  p new_string
  new_string
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'