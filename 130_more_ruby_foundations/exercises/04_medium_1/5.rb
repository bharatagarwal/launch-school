items = ['apples', 'corn', 'cabbage', 'wheat']  # => ["apples", "corn", "cabbage", "wheat"]

def gather(items)
  puts "Let's start gathering food."  # => nil
  yield(items)                        # => nil
  puts "We've finished gathering!"    # => nil
end                                   # => :gather

# 1
# gather(items) do |*first, second|
#   puts first.join(', ')
#   puts second
# end

# 2
# gather(items) do |first, *second, third |
#   puts first
#   puts second.join(', ')
#   puts third
# end

# 3
# gather(items) do |first, *second|
#   puts first
#   puts second.join(', ')
# end

# 4 
gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third} and #{fourth}"  # => nil
end                                                   # => nil

# >> Let's start gathering food.
# >> apples, corn, cabbage and wheat
# >> We've finished gathering!

# This has also shown us a key difference between how arrays are passed as parameters either to a block or a method. When yielded to a block, an array's individual elements will get converted to a list of items if the block parameters call for that conversion(such as when we have parameters like |apples, *assorted|).