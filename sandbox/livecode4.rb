# a = [50, 60, 60, 45, 70] 
a = [50,60,60,45,70]

odd = []
even = []

a.each_with_index do |element, index|
  if index % 2  == 0
    even.push(element)
  else
    odd.push(element)
  end
end

p odd
p even

sum_odd = odd.reduce { |sum, element| sum+=element }
sum_even = even.reduce { |sum, element| sum+=element }

p sum_odd
p sum_even