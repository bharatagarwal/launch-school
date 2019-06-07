# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# problem

# input: string
# output: boolean

# the parantheses on these need to be balanced.
# Therefore, ( needs to come first, then the )
# (asdsadasd(asdasda(asds)))
# create a counter
# increment it for every open bracket
# decrement for every close bracket
# if counter becomes negative, then return false
# at the end of the string, the counter should be zero for the parantheses to make sense

# algorithm
# breaking down the string into characters
# declare a counter
# check if character is (
# if so increment
# if ) then decrement

def balanced?(string)
  counter = 0
  
  string.chars.each do |char|
    if char == '('
      counter += 1
    elsif char == ')'
      counter -= 1
      return false if counter < 0
    end
    
    print "#{counter} "
  end
  return true if counter == 0
  false
end

p balanced?('What (is) this?')  == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false