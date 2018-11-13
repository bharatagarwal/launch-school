def every_other(array)
  new_array = []

  array.each_with_index do |element, index|
    new_array << element if index.even?
  end

  new_array
end

def every_other_alt(array)
  new_array = []
  index = 0

  while index < array.length
    new_array << array[index]
    index += 2
  end

  new_array
end

array = (1..10_000).to_a.shuffle

starting_time = Time.now
every_other(array)
time_taken = Time.now - starting_time
p time_taken # select.with_index takes a similar amount of time.
             # 0.001033

array = (1..10_000).to_a.shuffle

starting_time = Time.now
every_other_alt(array)
time_taken = Time.now - starting_time
p time_taken # 0.000328

array = (1..100_000).to_a.shuffle

starting_time = Time.now
every_other(array)
time_taken = Time.now - starting_time
p time_taken # 0.011413


array = (1..100_000).to_a.shuffle

starting_time = Time.now
every_other_alt(array)
time_taken = Time.now - starting_time
p time_taken # 0.003393