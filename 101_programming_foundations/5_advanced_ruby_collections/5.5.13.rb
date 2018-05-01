arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |element|
            element.select do |e| 
              e.odd?
            end
          end

p new_arr