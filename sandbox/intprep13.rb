def crunch(string)
  size = string.size
  index = 0

  while index < size
    if string[index] == string[index + 1]
      string[index..index + 1] = string[index]
      size -= 1
    else
      index += 1
    end
  end

  string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''