array = [1, 2, 3, 4, 5]

def select(array)
  new_array = []

  array.each do |element|
    new_array << element if yield(element)
  end

  new_array
end

select(array) { |num| num.odd? }
select(array) { |num| false }
select(array) { |num| num + 1 }