class Die

  def initialize
    roll
  end

  def roll
    @number_showing = 1 + rand(6)
  end

  def showing
    @number_showing
  end

  def cheat num
    if num > 6 || num < 1
      print "You can't do that!"
    else
      @number_showing = num
    end
  end

end


print  Die.new.cheat(4)