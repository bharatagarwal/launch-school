# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

ALPHABETS = ('A'..'Z').to_a + ('a'..'z').to_a

def squeeze(string)
  size = string.size
  index = 0

  while index < size
    if string[index..index + 1] == '  '
      string[index..index + 1] = ' '
      size -= 1
    else
      index += 1
    end
  end

  string
end

def cleanup_string(string)
  cleaned_string = string.chars.map do |char|
                     if ALPHABETS.include?(char) == false
                       ' '
                     else
                       char
                     end
                   end.join('')

  cleaned_string
end

def cleanup(string)
  squeeze(cleanup_string(string))
end

p cleanup("---what's my +*& line?") == ' what s my line '



