require 'pry'

# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.


ALPHABETICAL = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  new_string = ''
  index = 1
  string.chars.each do |char|
    if ALPHABETICAL.include?(char)
      # binding.pry
      if (index).odd?
        new_string << char.upcase
      else
        new_string << char.downcase
      end
      index += 1
    else
      new_string << char
    end
  end

  p new_string
  new_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'