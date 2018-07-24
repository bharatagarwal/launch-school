# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# algorithm

# after midnight
# hours * 60 + minutes

# before midnight(12:34) == after midnight(11:26)
# before midnight(hh:mm) == after midnight((24 - (hh+1)).remainder(24):(60 - mm).remainder(60))

def after_midnight(string)
  hours, minutes = string.split(':').map(&:to_i)
  hours.remainder(24) * 60 + minutes
end

def before_midnight(string)
  (1440 - after_midnight(string)).remainder(1440)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0