def valid?(sides)
  return false if sides.any? { |side| side <= 0}

  lowest, other, highest = sides.sort

  lowest + other > highest ? true : false
end

def triangle(first, second, third)
  sides = [first, second, third]
  if valid?(sides)
    unique_values = sides.uniq.size
    
    case unique_values
    when 3 then :scalene
    when 2 then :isosceles
    when 1 then :equilateral
    end
  else
    :invalid
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid