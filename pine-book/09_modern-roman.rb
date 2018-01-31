# convert number to old school roman numeral

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


# def convert_to_roman number

#   roman = ''

#   # M for 1000, adding M's for 1000s, and stripping out 1000s from number
#   roman += 'M'*(number/1000)
#   number = number % 1000

#   # D for 500
#   roman += 'D'*(number/500)
#   number = number % 500

#   # C for 100
#   roman += 'C'*(number/100)
#   number = number % 100

#   # L for 50
#   roman += 'L'*(number/50)
#   number = number % 50

#   # X for 10
#   roman += 'X'*(number/10)
#   number = number % 10

#   # V for 5
#   roman += 'V'*(number/5)
#   number = number % 5

#   # I for 1
#   roman += 'I'*(number/1)
#   number = number % 1

#   return roman
# end

# print "Enter numeral: "
# num = gets.chomp.to_i

# puts "Your old-school roman numeral is: " + convert_to_roman(num).to_s
