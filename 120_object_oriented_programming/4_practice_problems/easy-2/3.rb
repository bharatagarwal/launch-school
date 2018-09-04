module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

# p HotSauce.new.ancestors 
# NoMethodError, since it's a class method.

p HotSauce.ancestors
p Orange.ancestors
p Taste.ancestors