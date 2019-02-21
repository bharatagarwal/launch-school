counter_outside = 0

loop do
  puts "First line of outer loop"
  puts "Outside counter: #{counter_outside}"
  counter_inside = 0
  counter_outside += 1

  loop do
    puts "First line of inner loop"
    puts "Inside counter: #{counter_inside}"
    counter_inside += 1
    # return 'hello' ends loop prematurely

    break if counter_inside == 2
  end

  break if counter_outside == 2
end

# >> First line of outer loop
# >> Outside counter: 0
# >> First line of inner loop
# >> Inside counter: 0
# >> First line of inner loop
# >> Inside counter: 1
# >> First line of outer loop
# >> Outside counter: 1
# >> First line of inner loop
# >> Inside counter: 0
# >> First line of inner loop
# >> Inside counter: 1

# implies that break in a loop will only break out of current context.