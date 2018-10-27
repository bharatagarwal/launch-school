# Consider a characters set consisting of letters, a space, and a point. 

# Words consist of one or more, but at most 20 letters.

# An input text consists of one or more words separated from each other by one or more spaces and terminated by 0 or more spaces followed by a point.

# Input should be read from, and including, the first letter of the first word, up to and includng the terminating point.

# The output text is to be produced such that successive words are separated by a single space with the lest word being terminated by a single point.

# Odd words are copied in reverse order while even words are merely echoed.

# BONUS POINTS: the characters must be read and printed one at a time.

# input string:  "whats the matter with kansas ."
# output string: "whats eht matter htiw kansas."

# character set - [a-zA-Z .]
# word size [1..20] letters
# input text: (one or more words)(one or more spaces)(0 or more spaces)(.)
# output: (successive) (words) (separated by single point)/
# odd words copied in reverse order, even words echoed.
# character read and printer one at a time.

# word = ^([a-zA-Z]{1, 20})[ ]+\1*[ ]*.

input_string
  .split(/\b[a-zA-Z]+\b/)
  .map.with_index do |element, index|
    index % 2 == 0 ? element : element.reverse
  end.join(' ')