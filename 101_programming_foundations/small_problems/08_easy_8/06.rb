# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(start, finish)
  (start..finish).to_a.map do |val|
    if val % 15 == 0
      'FizzBuzz'
    elsif val % 3 == 0
      'Fizz'
    elsif val % 5 == 0
      'Buzz'
    else
      val
    end
  end.join(', ')
end


p fizzbuzz(1, 15)