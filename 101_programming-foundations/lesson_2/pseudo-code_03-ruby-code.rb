def find_greatest (numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num
    # ||= assigns given value if variable has a falsy value i.e. false or nil

    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end