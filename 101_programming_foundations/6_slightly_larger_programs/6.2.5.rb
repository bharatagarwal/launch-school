require 'pry'

def double_num num
  num * 2
end

arr = [1,2,3].map do |num|
  double_num(num)
  binding.pry
end

p arr

# nil, nil, nil with binding.pry
# reason not to use it at end of method