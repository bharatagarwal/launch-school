advice = "Few things in life are as important as house training your pet dinosaur."

# advice.gsub!('important', 'urgent')

# could have also used sub, which substitutes first instance, and not all.

advice =  advice.split(' ')

advice[advice.index('important')] = 'urgent'

# index and find_index can be used interchangeably.

advice = advice.join(' ')

p advice

test = 'hello, hello, hello, how low?'
test.gsub!('hello', 'smells')

p test # => 'smells, smells, smells, how low?'