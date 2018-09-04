class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

BeesWax.new(:fresh).describe_type

# It is standard practice to refer to instance variables inside the class without @ if the getter method is available.

