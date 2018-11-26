

# stacks and queues are simply arrays with restrictions

# they are elegant tools for handling temporary data.
# use cases - operating system architecture, printing jobs, traversing data.
# UNDO is perfect for stacks.

# STACK
# ---

# insertion from top
# reading from top
# removal from top

# []
# []
# []
# []
# []
# ---

# push 5
# [5] | [5]

# push 3
# [3]
# [5] | [5][3]

# push 0
# [0]
# [3]
# [5] | [5][3][0]

# pop
# [3]
# [5] | [5][3]

# pop
# [5] | [5]


# LET'S MAKE A JAVASCRIPT LINTER 
# THAT CHECKS OPENING & CLOSING BRACES
# -----

# paren-thesis, square brackets, curly braces
# (),           [],              {}

# type 1: opening brace doesn't have a corresponding brace
# (var x = 2;
# type 2: closing brace never preceded with an opening brace
# var x = 2;)
# type 3: different types of opening and closing braces.
# (var x=[1,2,3)];

# algorithm
# ---


# prepare an empty stack, read each char from left to right.
# ignore any char that's not a brace
# if opening brace found, push to stack.
# if closing brace found, inspect top element of stack
# if stack empty, error type 2
# if closing brace not the same, error type 3
# if closing brace the same, pop from top of the stack.
# if we're at the end of the line and stack is not empty, throw error and pop.

(var x = {y: [1, 2, 3]})

class Linter
  attr_reader :error

  def initialize
    @stack = []
  end

  def lint(text)
    text.chars.each_with_index do |char, index|
      if opening_brace?(char)
        @stack.push(char)
      elsif closing_brace?(char)
        if closes_most_recent_opening_brace?(char)
          @stack.pop
        else
          @error = "Incorrect closing brace: #{char} at index #{index}"
          return
        end
      end
    end
    
    if @stack.any?
      @error = "#{@stack.last} does not have a closing brace."
    end
  end

  private

  def opening_brace?(char)
    ['(', '[', '{'].include?(char)
  end

  def closing_brace?(char)
    [')', ']', '}'].include?(char)
    
  end

  def opening_brace_of(char)
    {
      '}' => '{',
      ')' => '(',
      ']' => '['
    }[char]
    
  end

  def most_recent_opening_brace
    @stack.last
  end

  def closes_most_recent_opening_brace?(char)
    opening_brace_of(char) == most_recent_opening_brace
  end
end