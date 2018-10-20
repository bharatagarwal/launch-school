def each_with_object(array, object)
  array.each do |element|            # => [1, 3, 5], [1, 3, 5], [1, 3, 5], []
    yield(element, object)           # => [1], [1, 9], [1, 9, 25], [[1]], [[1], [1, 2, 3]], [[1], [1, 2, 3], [1, 2, 3, 4, 5]], 1, 9, 25
  end                                # => [1, 3, 5], [1, 3, 5], [1, 3, 5], []

  object  # => [1, 9, 25], [[1], [1, 2, 3], [1, 2, 3, 4, 5]], {1=>1, 3=>9, 5=>25}, {}
end       # => :each_with_object

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2                                         # => [1], [1, 9], [1, 9, 25]
end                                                        # => [1, 9, 25]
result == [1, 9, 25]                                       # => true

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a                                  # => [[1]], [[1], [1, 2, 3]], [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
end                                                        # => [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]                # => true

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2                                   # => 1, 9, 25
end                                                        # => {1=>1, 3=>9, 5=>25}
result == { 1 => 1, 3 => 9, 5 => 25 }                      # => true

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end                                                 # => {}
result == {}                                        # => true