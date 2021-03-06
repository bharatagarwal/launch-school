# convert number to modern school roman numeral

conversion_table = [
  [1000,'M'],
  [900, 'CM'],
  [500, 'D'],
  [400, 'CD'],
  [100, 'C'],
  [90, 'XC'],
  [50, 'L'],
  [40, 'XL'],
  [10, 'X'],
  [9, 'IX'],
  [5, 'V'],
  [4, 'IV'],
  [1, 'I']
]

print "Enter numeral: "
num = gets.chomp.to_i
roman = ''

conversion_table.each do |pair|
  if num >= pair[0]
    roman += pair[1]* (num / pair[0])
    num = num % pair[0]
  end
end

puts "Your modern roman numeral is: #{roman}"
