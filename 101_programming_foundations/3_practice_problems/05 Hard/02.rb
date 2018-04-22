greetings = { a: 'hi' }
informal_greeting = greetings[:a]
# informal_greeting = greetings[:a].clone
# this will create a copy and not maintain the reference.

informal_greeting << ' there'
# informal_greeting += ' there' if you don't want to mutate

puts informal_greeting  #  => "hi there"
puts greetings

# a => 'hi there'