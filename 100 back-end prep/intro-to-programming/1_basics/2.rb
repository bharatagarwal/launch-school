# take a 4 digit number and find the digit in the 1000s, 100s, 10s and 1s.

digit  = 2399

thousands = digit/1000
hundreds = (digit%1000)/100
tens = (digit%100)/10
ones = digit%10

puts thousands
puts hundreds
puts tens
puts ones
