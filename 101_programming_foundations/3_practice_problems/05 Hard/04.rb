def is_an_ip_number?(value)
  (0..255).cover?(value.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  if dot_separated_words.size == 4  

    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      break unless is_an_ip_number?(word)
    end
    
    if dot_separated_words.size > 0
      false
    else
      true
    end
  else
    false
  end

end

# false condition
# less than or greater than 4

p dot_separated_ip_address?('hello')
p dot_separated_ip_address?('1.2.3.4')
p dot_separated_ip_address?('1.256.3.4')
p dot_separated_ip_address?('1.1')
p dot_separated_ip_address?('1.1.5.6.1')

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false unless dot_separated_words.size == 4

#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     return false unless is_an_ip_number?(word)
#   end

#   true
# end

# ls solution liberally uses 'return false unless', cutting the code more cleanly than my way.

# use return to cut short wasteful paths, and then proceed without worry if the condition is passed.