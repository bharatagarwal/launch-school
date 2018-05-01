# 1.05


def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

# be cognizant of the loop iterating fully. either counter should have been zero, or loop condition should have been counter > string.size

-----
#2.04

if a = 2

# always truthy, either the loop is not required, or
# there was an assigment in error

#2.06 read pseudocode very carefully.

Given a sentence made up of several words, write a method to do the following.

Iterate through the words one by one.
  - save the first word as the starting value.
  - starting with the "next" word iterate through all the remaining words in the sentence
  - for each iteration, compare the saved value with the current word.
  - if the word is longer or the same length as the saved value:
    - reassign the saved value as the current word
  - move on to the next word

After iterating through the sentence, return the saved value.

First word needs to be popped!

ie. saved_word = words.shift, not words[0].

# 2.10

# blocks declared in main has same scope as main

# variables declared in if..else are accessible even if they are defined within conditions that don't allow for their execution - and possess a value of nil.

if false
  b = 'hello'
end

p b # => nil

# method do..end is a block, but while 'condition' do... end is not considered a block.

# while, for and until consider 'do' to be optional.

# 2.12

def extend_greeting(greeting)
  greeting + 'there' 
end

# this is valid, and will do the job.

# 2.15 methods defined within the same scope can be invoked from other methods at the same scope.

def name # same scope
  'Geroge'
end

def display_name # same scope
  puts name
end

display_name # => Geroge 

----

# 3.02



