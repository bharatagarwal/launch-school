=begin
chars: letter, space, point
  - invalid inputs? (//\\\\[]))
words: 1-20 letters
  - more than 20 letters?
input:
  - 1 - * words
  - seperated by 1 - * spaces
  - terminated by 0 - * spaces, followed by a point
output: 
  - wordsL have odd words reversed
  - separated by 1 space
  - terminated: 0 space, followed by a point

input:
  - ''
  - '.'
  - " hello . "

test cases:
=end


reverse_odd_words("hello") => "hello"
reverse_odd_words(
reverse_odd_words
