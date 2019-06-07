def digit_list(number)
  number.to_s.chars.map(&:to_i)
end