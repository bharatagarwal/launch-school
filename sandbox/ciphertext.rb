def ciphertext(text)
  return text if text.empty?

  str = normalize(text)
  columns = calculate_columns(str.length)
  rows = split_in_rows(str, columns)
  encode(rows)
end

def normalize(str)
  str.downcase.chars.select { |char| char.match?(/[a-z0-9]/) }.join
end

def calculate_columns(length)
  Math.sqrt(length).ceil
end

def split_in_rows(str, columns)
  str.scan(/\w{#{columns}}|\w+/)
end

def encode(array)
  new_array = array.first.chars
  array[1..-1].each do |str|
    str.chars.each_with_index { |char, idx| new_array[idx] << char }
  end
  new_array.join(' ')
end

plaintext = 'This is fun!'
p ciphertext(plaintext) == 'tsf hiu isn'