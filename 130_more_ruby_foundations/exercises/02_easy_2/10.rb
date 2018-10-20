def test1
  hash = {}
  each_cons([1, 3, 6, 10], 1) do |value|
    hash[value] = true
  end
  hash == { 1 => true, 3 => true, 6 => true, 10 => true }
end

def test2
  hash = {}
  each_cons([1, 3, 6, 10], 2) do |value1, value2|
    hash[value1] = value2
  end
  hash == { 1 => 3, 3 => 6, 6 => 10 }
end

def test3
  hash = {}
  each_cons([1, 3, 6, 10], 3) do |value1, *values|
    hash[value1] = values
  end
  hash == { 1 => [3, 6], 3 => [6, 10] }
end

def test4
  hash = {}
  each_cons([1, 3, 6, 10], 4) do |value1, *values|
    hash[value1] = values
  end
  hash == { 1 => [3, 6, 10] }
end

def test5
  hash = {}
  each_cons([1, 3, 6, 10], 5) do |value1, *values|
    hash[value1] = values
  end
  hash == {}
end

def each_cons(array, number)
  index = 0
  increment = number - 1

  while index + increment < array.size
    args = array[index..index + increment]
    yield(*args)
    index += 1
  end
end

p test1
p test2
p test3
p test4
p test5