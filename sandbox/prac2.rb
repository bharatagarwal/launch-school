# input: starting number, ending number
# print all numbers between them
# print fizz if divisible by 3
# print buzz if divisible by 5
# print fizzbuzz if divisible by 15

def fizzbuzz(starting_number, ending_number)
  (starting_number..ending_number).map do |num|
    if num % 3 == 0 && num % 5 == 0
      'FizzBuzz'
    elsif num % 5 == 0
      'Buzz'
    elsif num % 3 == 0
      'Fizz'
    else
      num
    end
  end
end

print fizzbuzz(1,15).join(', ')