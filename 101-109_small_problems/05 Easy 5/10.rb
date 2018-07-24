# Write a method that will take a short line of text, and print it within a box.

# problem
# take given string, and present it in a box
# a box has + in the corner and - for lines.

# data structures
# input: string
# output: array, and you apply puts on it.
# array size is going to be 5.

# algorithm
# get size of message.

def print_in_box(message)
  size = message.length
  array = [
    "+-" + '-' * size + '-+',
    "| " + ' ' * size + " |",
    "| " +   message  + " |",
    "| " + ' ' * size + " |",
    "+-" + '-' * size + "-+"]

  puts array
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
