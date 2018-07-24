# write a method that takes a string, and returns a boolean indicating whether the paranthesis are balanced or not.

# check for opening bracket
# if no bracket, check if last is bracket
# if no last bracket, true, else false
# if opening bracket,
# check if last char is a bracket.

def balancer(string)
  return false unless string.count('(') == string.count(')')

  paranthesis_count = 0
  string.chars.each do |char|
    paranthesis_count += 1 if char == '('
    paranthesis_count -= 1 if char == ')'
    if paranthesis_count < 0
      return false
    end
  end

  if paranthesis_count == 0
    return true
  else
    return false
  end

end

p balancer('hi') == true
p balancer("(hi") == false
p balancer("(hi)") == true
p balancer("hi)") == false
p balancer(")hi(") == false