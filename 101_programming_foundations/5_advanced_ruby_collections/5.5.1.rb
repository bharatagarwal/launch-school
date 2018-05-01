# How would you order this array of number strings by descending numeric value?


arr = ['10', '11', '9', '7', '8']

int_arr = arr.map do |e|
            e.to_i
          end

int_arr.sort! do |a,b|
  b <=> a
end

arr = int_arr.map do |e|
          e.to_s
        end

p arr

# arr.sort do |a,b|
#   b.to_i <=> a.to_i
# end

# arr.sort_by do |e|
#   e.to_i
# end
# arr.reverse!