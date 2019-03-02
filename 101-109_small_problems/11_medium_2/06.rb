def valid?(sides)
  length_validity = sides.all? do |side|
                      side > 0 && side < 180
                    end

  length_validity && (sides.sum == 180)
end

def triangle(first, second, third)
  sides = [first, second, third]
  if valid?(sides)
    if sides.include?(90)
      :right
    elsif sides.any? { |side| side > 90 }
      :obtuse
    else
      :acute
    end
  else
    :invalid
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid