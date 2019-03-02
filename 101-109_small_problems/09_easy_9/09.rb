
# input: three integers
# output: grade alphabet

# get average of grades
# 

def get_grade(first, second, third)
  avg = (first + second + third) / 3

  if (90..100).include?(avg)
    'A'
  elsif (80...90).include?(avg)
    'B'
  elsif (70...80).include?(avg)
    'C'
  elsif (60...70).include?(avg)
    'D'
  elsif (0...60).include?(avg)
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"