update temperatures
set rainfall = (high + low) / 2 - 35
where (high + low) / 2 > 35