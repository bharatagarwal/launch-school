def time_of_day(number)
  truncated_minutes = number.remainder(24 * 60)
  hours, minutes = truncated_minutes.divmod(60)
  if truncated_minutes >= 0
    format(hours, minutes)
  else
    format(24 + hours, minutes)
  end
end

def format(hours, minutes)
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

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"