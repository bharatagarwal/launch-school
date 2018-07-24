# take a string as an argument, and return its reverse.
# without using #.reverse
# use #.pop

def string_reverser(string)
  new_array = []
  array_chars = string.split('')

  while reversed_string.length > 0
    new_array << reversed_string.pop
  end

  new_array.join('')
end

p string_reverser('Hello')