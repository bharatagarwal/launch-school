famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

p "Four score and " << famous_words

p "Four score and " + famous_words

p famous_words.prepend("Four score and ") # mutating