require 'pry'

# When robots come off the factory floor, they have no name.The first time you boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

# The names must be random: they should not follow a predictable sequence. Random names means a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

# problem
# robot has a randomly assigned name the first time it boots up, must match the regex.
# reset to factory setting, 
# a new name is assigned.

# the names must be random. should not allow same name when avoidable.

class Robot
  @@names = []
  ALPHABETS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a

  attr_reader :name

  def initialize
    @name = ''
    generate_name
  end

  def reset
    generate_name
  end

  private

  def generate_name
    create_name_candidate

    while @@names.include?(@name_candidate)
      create_name_candidate
    end

    @name = @name_candidate
    @@names << @name
  end

  def create_name_candidate
    @name_candidate = ''
    2.times { @name_candidate << ALPHABETS.sample }
    3.times { @name_candidate << NUMBERS.sample }
  end
end