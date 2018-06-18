# a = [50, 60, 60, 45, 70] 
a = [50,60,60,45,70]

odd = []
even = []

a.each_with_index do |element, index|
  if index.even?
    even << element
  elsif index.odd?
    odd << element
  end
end

p odd
p even

sum_odd = odd.reduce(:+)
sum_even = even.reduce(:+)

p sum_odd
p sum_even