[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# 1 => true
# the any method stops as soon as it gets its first true.