require 'pry'

# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# problem
# input: minutes in Integer form
# return time in 24 HH:MM format

# data structures
# input: Integer
# output: String

# algorithm
# divide number of minutes by 60 to get hours, and remainder will be number of minutes.
# remainder of no. of hours divided by 24 will give data in 24 HR format

def format_time(hours, minutes)
  if hours < 10 && minutes < 10
    "0#{hours}:0#{minutes}"
  elsif hours >= 10 && minutes < 10
    "#{hours}:0#{minutes}"
  elsif hours < 10 && minutes >= 10
    "0#{hours}:#{minutes}"
  else
    "#{hours}:#{minutes}"
  end
end

def time_of_day(minutes)
  hours, minutes = minutes.divmod(60)
  hours_in_day = hours.remainder(24)
  binding.pry
  if hours_in_day < 0
    format_time(24 + hours_in_day, minutes)
  else
    format_time(hours_in_day, minutes)
  end
end


# p time_of_day(350) == "05:50"
# p time_of_day(-100) == "22:20"
# p time_of_day(-300) == "19:00"
# p time_of_day(-30) == "23:30"
# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"