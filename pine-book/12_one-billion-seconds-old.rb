now = Time.new
birth = Time.local(1990, 9, 15, 9, 15)

seconds_alive = now - birth
one_billion_old = birth + 1000000000


puts "Age now: "
puts (seconds_alive/1000000000).to_s + " billion seconds"

puts "One billion seconds from birth: "
puts one_billion_old