# yield element
# if yield falsey
# return current plus rest of array

def drop_while array
  array.each_with_index do |element, index|
    if !yield(element)
      return array[index..-1]
    end
  end

  []
end
  
drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]

drop_while([1, 3, 5, 6]) { |value| true } == []
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
drop_while([]) { |value| true } == []