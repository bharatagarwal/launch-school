string = "the flintstones rock"

def titleize(string)
  words = string.split

  words.map do |word|
    word.capitalize!
  end

  words.join(' ')
end

p titleize(string)

# or words.split.map { |word| word.capitalize }.join(' ')