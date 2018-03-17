class Integer
  def factorial
    if self < 0
      return 'You cannot take the factorial of a negative number!'
    end

    if self <= 1
      1
    else
      self * (self - 1).factorial
    end

  end
end

print 8.factorial