# brute force

def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    # number keeps getting reassigned
    digits.unshift(remainder)
    break if number == 0
  end

# divmod returns array of size 2 containing the quotient and remainder.
# the remainder always walks to the right on the number line
# for negative numbers, the quotient walks an extra back, and then the
# remainder walks to the right.

  digits
end