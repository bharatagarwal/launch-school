# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(string)
  
  previous = ''

  string.chars.each_with_object('') do |char, new_string|
    if char != previous
      new_string << char
    end

    previous = char
  end
end

# previous rather than index + 1

p crunch('4444abcabccba')

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''