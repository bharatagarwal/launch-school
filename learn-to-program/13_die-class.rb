class Die

  def roll
    1+ rand(6)
  end

end

dice = [Die.new, Die.new]

print dice[1].roll