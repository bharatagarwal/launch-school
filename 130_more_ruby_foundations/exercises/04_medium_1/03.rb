# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']  # => ["apples", "corn", "cabbage", "wheat"]

def gather(items)
  puts "Let's start gathering food."  # => nil
  yield(items)                        # => nil
  puts "Let's start gathering food."  # => nil
end                                   # => :gather

gather(items) { |produce| puts produce.join('; ')}  # => nil

# >> Let's start gathering food.
# >> apples; corn; cabbage; wheat
# >> Let's start gathering food.