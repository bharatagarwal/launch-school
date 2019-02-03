# Create a clock that is independent of date.
# You should be able to add and subtract minutes to it. Two clocks that represent the same time should be equal to each other.

# Example methods
# Clock.at(8).to_s        # => '08:00'
# Clock.at(11, 9).to_s    # => '11:09'
# (Clock.at(10) + 3).to_s # => '10:03'
# Clock.at(23,30) + 60 # => 00:30
# Clock.at(15, 37) == Clock.at(15, 37)
# Clock.at(0, 30) - 60 # => 23:30

class Clock
  attr_reader :hour, :minute
  def initialize(hour, minute=0)
    @hour = hour
    @minute = minute
    @total_minutes = @hour * 60 + @minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(minutes)
    if (@total_minutes + minutes) > 60*24
      @hour, @minute = (@total_minutes + minutes - 60*24).divmod(60)
    else
      @hour, @minute = (@total_minutes + minutes).divmod(60)
    end
    self
  end

  def -(minutes)
    if (@total_minutes - minutes) < 0
      @hour, @minute = (@total_minutes - minutes + 24*60).divmod(60)
    else
      @hour, @minute = (@total_minutes - minutes).divmod(60)
    end
    self
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  def to_s
    "#{format(@hour)}:#{format(@minute)}"
  end

  def format(integer_unit)
    if integer_unit < 10
      "0#{integer_unit}"
    else
      integer_unit.to_s
    end
  end
end